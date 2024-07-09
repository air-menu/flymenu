import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flymenu/constants/assets.constant.dart';
import 'package:flymenu/pages/auth/forgot_password.dart';
import 'package:flymenu/pages/auth/register-info-logic.dart';
import 'package:flymenu/pages/auth/register.dart';
import 'package:flymenu/components/language/dropdown.dart';


class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginView();
}

class _LoginView extends State<LoginView> {
  bool _isPasswordVisible = false;
  final TextEditingController _password = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final RegisterInfoLogic _registerInfoLogic = RegisterInfoLogic();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: screenSize.width,
          height: screenSize.height,
          padding: const EdgeInsets.all(40),
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
                controller: _email,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: FlutterI18n.translate(context, 'user.email'),
                ),
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
                key: const ValueKey('message_error.password_field'),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const ForgotPassword()),
                      );
                    },
                    child: Text(FlutterI18n.translate(context, 'button.forgot_password')),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _registerInfoLogic.onConnectUser(
                    email: _email.text,
                    password: _password.text,
                    context: context),
                child: Text(
                  FlutterI18n.translate(context, 'button.login'),
                ),
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: () =>
                    _registerInfoLogic.onConnectWithGoogle(context: context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const ImageIcon(
                      AssetImage(AssetsConstant.googleIcon),
                      size: 25,
                    ),
                    const SizedBox(width: 15),
                    Text(FlutterI18n.translate(
                        context, 'button.connect_with_google')),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Register()),
                      );
                    },
                    child: Text(
                        FlutterI18n.translate(context, 'button.register')),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
