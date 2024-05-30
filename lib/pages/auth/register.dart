import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flymenu/constants/assets.constant.dart';
import 'package:flymenu/pages/auth/register-info-logic.dart';
import 'package:flymenu/pages/auth/register-info.dart';
import 'package:flymenu/services/auth/authentication_service.dart';
import 'package:flymenu/services/auth/message_error.dart';
import 'package:flymenu/components/language/dropdown.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _Register();
}

class _Register extends State<Register> {
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  final ErrorService _errorService = ErrorService();
  final RegisterInfoLogic _registerInfoLogic = RegisterInfoLogic();

  void _register() async {
    if (_password.text.isEmpty || _email.text.isEmpty) {
      _errorService.handleErrorWithMessage(context,
          message: FlutterI18n.translate(context, 'KEY_ERROR_FILL_ALL_FIELDS'));
      return;
    }
    if (_password.text != _confirmPassword.text) {
      _errorService.handleErrorWithMessage(context,
          message: FlutterI18n.translate(
              context, 'KEY_ERROR_PASSWORDS_DO_NOT_MATCH'));
      return;
    }

    if (!_registerInfoLogic.isEmailValid(_email.text)) {
      _errorService.handleErrorWithMessage(context,
          message: FlutterI18n.translate(context, 'KEY_ERROR_INVALID_EMAIL'));
      return;
    }

    if (!_registerInfoLogic.isStringLengthValid(_password.text)) {
      _errorService.handleErrorWithMessage(context,
          message:
              FlutterI18n.translate(context, 'KEY_ERROR_PASSWORD_TOO_SHORT'));
      return;
    }

    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RegisterInfo(
          email: _email.text,
          password: _password.text,
          confirmPassword: _confirmPassword.text,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    AuthenticationService authenticationService = AuthenticationService();

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: screenSize.width,
          height: screenSize.height,
          padding: const EdgeInsets.all(50),
          child: Column(children: <Widget>[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Image(
                    image: AssetImage(AssetsConstant.flymenuIcon),
                    width: 100,
                  ),
                  Text(
                    FlutterI18n.translate(context, 'application.name'),
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: FlutterI18n.translate(context, 'user.email'),
                    ),
                    controller: _email,
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _password,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: FlutterI18n.translate(context, 'user.password'),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
                    obscureText: !_isPasswordVisible,
                    enableSuggestions: false,
                    autocorrect: false,
                    key: const ValueKey('password_field'),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                      controller: _confirmPassword,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: FlutterI18n.translate(
                            context, 'user.confirm_password'),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isConfirmPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _isConfirmPasswordVisible =
                                  !_isConfirmPasswordVisible;
                            });
                          },
                        ),
                      ),
                      obscureText: !_isConfirmPasswordVisible,
                      enableSuggestions: false,
                      autocorrect: false,
                      key: const ValueKey('confirmpassword_field'),
                      onSubmitted: (_) {
                        _register();
                      }),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      _register();
                    },
                    child: Text(FlutterI18n.translate(context, 'button.register')),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () =>
                  authenticationService.connectWithGoogle(context: context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const ImageIcon(
                    AssetImage(AssetsConstant.googleIcon),
                    size: 25,
                  ),
                  const SizedBox(width: 15),
                  Text(FlutterI18n.translate(context, 'button.connect_with_google')),
                ],
              ),
            ),
            const Spacer(),
            const Row(
              children: [
                LanguageDropdown(),
                Spacer(),
                // Ajoutez ici le widget pour le choix du thème de l'application
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                      FlutterI18n.translate(context, 'message_error.already_registered')),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
