import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:intl/intl.dart';
import 'package:flymenu/pages/auth/register-info-logic.dart';

class RegisterInfo extends StatefulWidget {
  final String ?email;
  final String ?password;
  final String ?confirmPassword;

  const RegisterInfo(
      {super.key,
      required this.email,
      required this.password,
      required this.confirmPassword});

  @override
  State<RegisterInfo> createState() => _RegisterInfo();
}

class _RegisterInfo extends State<RegisterInfo> {
  final TextEditingController _lastname = TextEditingController();
  final TextEditingController _firstname = TextEditingController();
  final TextEditingController _nickname = TextEditingController();
  final RegisterInfoLogic _registerLogic = RegisterInfoLogic();

  DateTime _birthdate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    FlutterI18n.translate(context, 'message.register_info'),
                    style: const TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    FlutterI18n.translate(context, 'application.name'),
                    style: const TextStyle(
                      fontSize: 52,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    FlutterI18n.translate(
                        context, 'message.register_info_description'),
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(80),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText:
                          FlutterI18n.translate(context, 'user.lastname'),
                    ),
                    controller: _lastname,
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText:
                          FlutterI18n.translate(context, 'user.firstname'),
                    ),
                    controller: _firstname,
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText:
                          FlutterI18n.translate(context, 'user.nickname'),
                    ),
                    controller: _nickname,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        initialDate: _birthdate,
                        firstDate: DateTime(1924),
                        lastDate: DateTime.now(),
                        helpText:
                            FlutterI18n.translate(context, 'message.select_birthdate'),
                        cancelText:
                            FlutterI18n.translate(context, 'button.cancel'),
                        confirmText: FlutterI18n.translate(context, 'button.confirm'),
                      ).then((value) {
                        setState(() {
                          _birthdate = value!;
                        });
                        DateFormat('dd/MM/yyyy').format(_birthdate);
                      });
                    },
                    child: Text(
                        '${FlutterI18n.translate(context, 'user.birthdate')}{_birthdate.day}/${_birthdate.month}/${_birthdate.year}'),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          _registerLogic.onRegisterUser(
                              email: widget.email!,
                              password: widget.password!,
                              confirmPassword: widget.confirmPassword!,
                              nickname: _nickname.text,
                              lastname: _lastname.text,
                              firstname: _firstname.text,
                              birthdate:
                                  DateFormat('dd/MM/yyyy').format(_birthdate),
                              context: context);
                        },
                        child: Text(
                            FlutterI18n.translate(context, 'button.validate')),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(FlutterI18n.translate(context, 'button.back')),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
