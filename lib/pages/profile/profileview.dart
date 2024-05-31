import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flymenu/services/auth/user_auth.dart';
import 'package:flymenu/services/auth/authentication_service.dart';
import 'package:flymenu/utils/styles.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileView();
}

class _ProfileView extends State<ProfileView> {
  final AuthenticationService _authService = AuthenticationService();

  @override
  Widget build(BuildContext context) {
    double padding = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: padding),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Text(
                    FlutterI18n.translate(context, 'KEY_PARAMETRAGE'),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Couleur.darkorange,
                    ),
                  ),
                  const SizedBox(width: 16),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StreamBuilder<User?>(
                      stream: _authService.currentUser,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.active) {
                          final user = snapshot.data;
                          if (user != null) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  user.displayName ?? 'Anonymous',
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Couleur.darkorange,
                                  ),
                                ),
                                Text(
                                  user.email ?? '',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Couleur.darkorange,
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return Text(FlutterI18n.translate(
                                context, 'KEY_CONNECT_TO_CHECK_DATA'));
                          }
                        }
                        return const CircularProgressIndicator();
                      },
                    ),
                  ],
                ),
              ),
            ),
            const Divider(),
            Container(
              padding:
                  const EdgeInsets.only(left: 50.0, top: 15.0, bottom: 15.0),
              child: InkWell(
                onTap: () {
                  setState(() {
                  //   Navigator.push(
                  //     context,
                  //     // MaterialPageRoute(
                  //         // builder: (context) => ProfileAccountMobileView(theme: Theme.of(context))),
                  //   // );
                  });
                },
                child: Row(
                  children: [
                    const Icon(Icons.person_pin_rounded,
                        size: 40, color: Couleur.darkorange),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Row(
                          children: [
                            Text(
                              FlutterI18n.translate(context, 'KEY_MY_ACCOUNT'),
                              style: const TextStyle(
                                  fontSize: 18, color: Couleur.darkorange),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.only(left: 50.0, top: 15.0, bottom: 15.0),
              child: InkWell(
                onTap: () {
                  setState(() {
                    // Navigator.push(
                      // context,
                      // MaterialPageRoute(
                          // builder: (context) => const ProfileRolesMobileView()),
                    // );
                  });
                },
                child: Row(
                  children: [
                    const Icon(Icons.person_pin_rounded,
                        size: 40, color: Couleur.darkorange),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Row(
                          children: [
                            Text(
                              FlutterI18n.translate(context, 'KEY_ROLES'),
                              style: const TextStyle(
                                  fontSize: 18, color: Couleur.darkorange),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.only(left: 50.0, top: 15.0, bottom: 15.0),
              child: InkWell(
                onTap: () {
                  setState(() {
                    // Navigator.push(
                      // context,
                      // MaterialPageRoute(
                          // builder: (context) => ProfileNotificationMobileView(
                              // theme: Theme.of(context))),
                    // );
                  });
                },
                child: Row(
                  children: [
                    const Icon(Icons.notifications,
                        size: 40, color: Couleur.darkorange),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Row(
                          children: [
                            Text(
                              FlutterI18n.translate(
                                  context, 'KEY_NOTIFICATIONS'),
                              style: const TextStyle(
                                  fontSize: 18, color: Couleur.darkorange),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.only(left: 50.0, top: 15.0, bottom: 15.0),
              child: InkWell(
                onTap: () {
                  setState(() {
                    // TODO: Voir si on fait une popup ou une page
                  });
                },
                child: Row(
                  children: [
                    const Icon(Icons.info, size: 40, color: Couleur.darkorange),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          FlutterI18n.translate(context, 'KEY_INFORMATIONS'),
                          style: const TextStyle(
                              fontSize: 18, color: Couleur.darkorange),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () async {
                await _authService.signOut(context);
                await Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => UserAuth()),
                );
              },
              icon: const Icon(Icons.exit_to_app),
              label: Text(FlutterI18n.translate(context, 'KEY_LOGOUT')),
            ),
          ],
        ),
      ),
    );
  }
}
