import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flymenu/constants/assets.constant.dart';
import 'package:flymenu/services/auth/authentication_service.dart';
import 'package:flymenu/styles.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPassword();
}

class _ForgotPassword extends State<ForgotPassword> {
  final TextEditingController _email = TextEditingController();
  AuthenticationService authenticationService = AuthenticationService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Couleur.offWhite,
      body: Container(
        margin: const EdgeInsets.all(50),
        child: Column(
          children: <Widget>[
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
                    FlutterI18n.translate(context, 'apllication.name'),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(FlutterI18n.translate(context, 'button.back')),
                      ),
                      const SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: () => authenticationService.passwordReset(
                            _email.text, context),
                        child: Text(FlutterI18n.translate(context, 'button.send')),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
