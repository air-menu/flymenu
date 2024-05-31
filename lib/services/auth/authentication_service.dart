// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flymenu/model/user.model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flymenu/utils/messages/popup.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flymenu/pages/auth/register-info.dart';
import 'package:flymenu/services/auth/message_error.dart';
import 'package:flymenu/constants/user.constant.dart';

import '../../main.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final ErrorService _errorService = ErrorService();

  Stream<User?> get currentUser => _firebaseAuth.authStateChanges();

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();
  Stream<String?> get currentUserId {
    return _firebaseAuth.authStateChanges().map((User? user) => user?.uid);
  }

  // Connexion utilisateur
  Future<void> connectUser({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    if (password.isEmpty || email.isEmpty) {
      _errorService.handleErrorWithMessage(context,
          message: 'Informations manquantes');
      return;
    }
    try {
      final user = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      if (user.user!.emailVerified) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MainContentView()),
        );
        print(user.user!.uid);
      } else {
        showErrorMessage(
            context, FlutterI18n.translate(context, 'message.verify_email'));
        await _firebaseAuth.signOut();
      }
    } on FirebaseAuthException catch (e) {
      print(e.code);
      switch (e.code) {
        case 'invalid-credential':
          showErrorMessage(
              context,
              FlutterI18n.translate(
                  context, 'message_error.invalid_credential'));
          break;
        case 'invalid-login-credentials':
          showErrorMessage(
              context,
              FlutterI18n.translate(
                  context, 'message_error.invalid_login_credential'));
          break;
        case 'user-not-found':
          showErrorMessage(context,
              FlutterI18n.translate(context, 'message_error.user_not_found'));
          break;
        case 'user-disabled':
          showErrorMessage(context,
              FlutterI18n.translate(context, 'message_error.user_disabled'));
          break;
        case 'wrong-password':
          showErrorMessage(context,
              FlutterI18n.translate(context, 'message_error.wrong_passsword'));
          break;
        case 'invalid-email':
          showErrorMessage(context,
              FlutterI18n.translate(context, 'message_error.invalid_email'));
          break;
        default:
          showErrorMessage(context, '${e.message}');
      }
    }
  }

  // Inscription utilisateur
  Future<void> registerUser({
    required String email,
    required String password,
    required String confirmPassword,
    required String lastname,
    required String firstname,
    required String birthdate,
    required String nickname,
    required BuildContext context,
  }) async {
    try {
      if (password == confirmPassword) {
        UserCredential userCredential =
            await _firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        String uid = userCredential.user!.uid;
        UserModel userModel = UserModel(
            uid: uid,
            email: email,
            password: password,
            nickname: nickname,
            lastname: lastname,
            firstname: firstname,
            birthdate: birthdate);

        await _firestore
            .collection(UserConstant.dbName)
            .doc(uid)
            .set(userModel.toMap());
        if (kDebugMode) {
          print('User registered with UID: $uid');
        }

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MainContentView()),
        );
      } else {
        _errorService.handleErrorWithMessage(context,
            message: 'Les champs ne peuvent pas être vides');
      }
    } on FirebaseAuthException catch (e) {
      _errorService.handleError(e, context);
    } catch (e) {
      _errorService.handleErrorWithMessage(context, message: '$e');
    }
  }

  // Connexion utilisateur avec google
  Future<void> connectWithGoogle({
    BuildContext? context,
  }) async {
    try {
      if (kIsWeb) {
        GoogleAuthProvider googleProvider = GoogleAuthProvider();

        googleProvider
            .addScope('https://www.googleapis.com/auth/contacts.readonly');

        UserCredential userCredential =
            await _firebaseAuth.signInWithPopup(googleProvider);

        if (userCredential.user != null) {
          // Détecte si c'est un nouvel utilisateur
          if (userCredential.additionalUserInfo?.isNewUser ?? false) {
            // Insere les données de l'utilisateur dans la base de données Firestore
            await _firestore
                .collection('users')
                .doc(userCredential.user!.uid)
                .set({
              'email': userCredential.user!.email,
              'photoURL': userCredential.user!.photoURL,
              'displayName': userCredential.user!.displayName,
              'uid': userCredential.user!.uid,
            });
            Navigator.pushReplacement(
              context!,
              MaterialPageRoute(
                  builder: (context) => RegisterInfo(
                      email: userCredential.user!.email,
                      password: null,
                      confirmPassword: null)),
            );
          } else {
            Navigator.pushReplacement(
              context!,
              MaterialPageRoute(builder: (context) => const MainContentView()),
            );
          }
        } else {
          Navigator.pushReplacement(
            context!,
            MaterialPageRoute(builder: (context) => const MainContentView()),
          );
        }
      } else {
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

        final GoogleSignInAuthentication? googleAuth =
            await googleUser?.authentication;

        if (googleAuth?.accessToken != null && googleAuth?.idToken != null) {
          // Create a new credential
          final credential = GoogleAuthProvider.credential(
            accessToken: googleAuth?.accessToken,
            idToken: googleAuth?.idToken,
          );
          UserCredential userCredential =
              await _firebaseAuth.signInWithCredential(credential);

          // Détecte si c'est un nouvel utilisateur
          if (userCredential.user != null) {
            if (userCredential.additionalUserInfo?.isNewUser ?? false) {
              // insere les donnes du user dans la db firestore
              await _firestore
                  .collection('users')
                  .doc(userCredential.user?.uid)
                  .set({
                'email': userCredential.user?.email,
                'photoURL': userCredential.user?.photoURL,
                'displayName': userCredential.user?.displayName,
                'uid': userCredential.user?.uid,
              });
              Navigator.pushReplacement(
                context!,
                MaterialPageRoute(
                    builder: (context) => RegisterInfo(
                        email: userCredential.user!.email,
                        password: null,
                        confirmPassword: null)),
              );
            } else {
              Navigator.pushReplacement(
                context!,
                MaterialPageRoute(
                    builder: (context) => const MainContentView()),
              );
            }
          } else {
            Navigator.pushReplacement(
              context!,
              MaterialPageRoute(builder: (context) => const MainContentView()),
            );
          }
        } else {
          Navigator.pushReplacement(
            context!,
            MaterialPageRoute(builder: (context) => const MainContentView()),
          );
        }
      }
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e.code);
      }
      switch (e.code) {
        case 'invalid-credential':
          showErrorMessage(context!, 'Email ou mot de passe incorrect');
          break;
        case 'invalid-login-credentials':
          showErrorMessage(context!, 'Email ou mot de passe incorrect');
          break;
        case 'user-not-found':
          showErrorMessage(context!, 'Aucun utilisateur trouvé avec cet email');
          break;
        case 'user-disabled':
          showErrorMessage(context!, 'Votre compte a été desactivé');
          break;
        case 'popup-closed-by-user':
          showErrorMessage(context!, 'Connexion annulé');
          break;
        case 'invalid-email':
          showErrorMessage(context!, 'Email invalide');
          break;
        case 'cancelled-popup-request':
          break;
        default:
          showErrorMessage(context!, '${e.message}');
      }
    }
  }

  // Envoie d'un email de vérification
  Future<void> sendEmailVerification(BuildContext context) async {
    try {
      _firebaseAuth.currentUser!.sendEmailVerification();
      showInfoMessage(context,
          'Un email de vérification à été envoyé à ${_firebaseAuth.currentUser!.email}, merci de vérifier votre boite mail, puis de vous reconnecter');
    } on FirebaseAuthException catch (e) {
      showErrorMessage(context, e.message!); // Display error message
    }
  }

  // Déconnection du compte
  Future<void> signOut(BuildContext context) async {
    try {
      await _firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      showErrorMessage(context, e.message!); // Displaying the error message
    }
  }

  // Supprimer le compte
  Future<void> deleteAccount(BuildContext context) async {
    try {
      await _firebaseAuth.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      showErrorMessage(context, e.message!); // Displaying the error message
      // if an error of requires-recent-login is thrown, make sure to log
      // in user again and then delete account.
    }
  }

  // Rénitialiser le mot de passe
  void passwordReset(email, BuildContext? context) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      showInfoMessage(context!, 'Email de réinitilialisation envoyé !');
    } on FirebaseException catch (e) {
      showErrorMessage(context!, '${e}');
    }
  }
}
