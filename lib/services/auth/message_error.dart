import 'package:flutter/cupertino.dart';
import 'package:flymenu/utils/messages/popup.dart';

class ErrorService {
  void handleError(e, context) {
    switch (e.code) {
      case 'invalid-credential':
      case 'invalid-login-credentials':
        handleErrorWithMessage(context,
            message: 'Email ou mot de passe incorrect', error: e);
        break;
      case 'invalid-email':
        handleErrorWithMessage(context, message: 'Email invalide', error: e);
        break;
      case 'email-already-in-use':
        handleErrorWithMessage(context,
            message: 'Cet email est déjà utilisé', error: e);
        break;
      case 'invalid-input':
        handleErrorWithMessage(context,
            message: 'Veuillez remplir tous les champs.', error: e);
        break;
      case 'invalid-passwords':
        handleErrorWithMessage(context,
            message: 'Mot de passe invalide', error: e);
        break;
      case 'user-not-found':
        handleErrorWithMessage(context,
            message: 'Aucun utilisateur trouvé avec cet email', error: e);
        break;
      case 'user-disabled':
        handleErrorWithMessage(context,
            message: 'Votre compte a été désactivé', error: e);
        break;
      case 'popup-closed-by-user':
        handleErrorWithMessage(context, message: 'Connexion annulée', error: e);
        break;
      case 'weak-password':
        handleErrorWithMessage(context,
            message: 'Le mot de passe n\'est pas assez robuste', error: e);
        break;
      default:
        handleErrorWithMessage(context, error: e);
    }
  }

  void handleErrorWithMessage(BuildContext context, {String? message, error}) {
    if (message != null) {
      showErrorMessage(context, message);
    } else {
      showErrorMessage(context, '${error.message}');
    }
  }

  void handleSuccess(BuildContext context, {String? message}) {
    if (message != null) {
      showSuccessMessage(context, message);
    } else {
      showSuccessMessage(context, 'Opération réussie');
    }
  }

  void handleInfo(BuildContext context, {String? message}) {
    if (message != null) {
      showInfoMessage(context, message);
    } else {
      showInfoMessage(context, 'Information');
    }
  }

  void handleWarning(BuildContext context, {String? message}) {
    if (message != null) {
      showWarningMessage(context, message);
    } else {
      showWarningMessage(context, 'Attention');
    }
  }
}
