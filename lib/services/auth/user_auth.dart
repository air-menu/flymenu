import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flymenu/main.dart';
import 'package:flymenu/pages/auth/login.dart';
import 'package:flymenu/services/auth/authentication_service.dart';

class UserAuth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: AuthenticationService().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final User? user = snapshot.data;
          if (user == null) {
            // si user non connecté
            return const LoginView();
          } else if (!user.emailVerified) {
            // si user connecté mais email non vérifié
            return const LoginView();
          }else {
            // redirection home si user connecté
            return const MainContentView();
          }
        }
        return const Scaffold();
      },
    );
  }
}
