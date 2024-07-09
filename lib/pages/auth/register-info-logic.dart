import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flymenu/main.dart';
import 'package:flymenu/services/auth/authentication_service.dart';
import 'package:flymenu/services/auth/message_error.dart';

class RegisterInfoLogic {
  final AuthenticationService authenticationService = AuthenticationService();
  final ErrorService _errorService = ErrorService();

  static const minAge = 10;

  void onRegisterUser(
      {required String email,
      required String password,
      required String confirmPassword,
      required String nickname,
      required String lastname,
      required String firstname,
      required String birthdate,
      required BuildContext context}) {
    if (!isEmailValid(email)) {
      _errorService.handleErrorWithMessage(context, message: 'Email invalide');
      return;
    }

    if (!isStringLengthValid(password)) {
      _errorService.handleErrorWithMessage(context,
          message: 'Mot de passe invalide');
      return;
    }

    DateTime now = DateTime.now();
    DateTime tenYearsAgo = now.subtract(const Duration(days: 365 * minAge));
    DateTime birthdateDate = DateFormat('dd/MM/yyyy').parse(birthdate);

    if (birthdateDate.isAfter(now) || birthdateDate.isAfter(tenYearsAgo)) {
      _errorService.handleErrorWithMessage(context,
          message: 'Date de naissance invalide');
      return;
    }

    if (nickname.isEmpty ||
        lastname.isEmpty ||
        firstname.isEmpty ||
        birthdate.isEmpty) {
      _errorService.handleErrorWithMessage(context,
          message: 'Informations manquantes');
      return;
    } else {
      authenticationService.registerUser(
          email: email,
          password: password,
          confirmPassword: confirmPassword,
          lastname: lastname,
          firstname: firstname,
          birthdate: birthdate,
          nickname: nickname,
          context: context);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainContentView()),
      );
    }
  }

  void onConnectUser({
    required String email,
    required String password,
    required BuildContext context,
  }) {
    if (!isEmailValid(email)) {
      _errorService.handleErrorWithMessage(context, message: 'Email invalide');
      return;
    }
    if (!isStringLengthValid(password)) {
      _errorService.handleErrorWithMessage(context,
          message: 'Mot de passe invalide');
      return;
    }
    authenticationService.connectUser(
        email: email, password: password, context: context);
  }

  void onConnectWithGoogle({required BuildContext context}) {
    authenticationService.connectWithGoogle(context: context);
  }

  bool isEmailValid(String email) {
    return email.contains('@') && email.contains('.');
  }

  bool isStringLengthValid(String input) {
    return input.length >= 8;
  }
}
