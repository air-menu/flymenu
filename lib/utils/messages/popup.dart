import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flymenu/utils/styles.dart';

void showWarningMessage(BuildContext context, String message,
    [VoidCallback? onContinue]) {
  showMessage(
    context,
    message,
    FlutterI18n.translate(context, 'message.warning'),
    Couleur.orange,
    FlutterI18n.translate(context, 'button.continue'),
    FlutterI18n.translate(context, 'button.cancel'),
  );
  if (onContinue != null) onContinue();
}

void showErrorMessage(BuildContext context, [String? errorMessage]) {
  errorMessage ??= FlutterI18n.translate(context, 'message.internal_error');
  showMessage(
      context,
      errorMessage,
      FlutterI18n.translate(context, 'message.error'),
      Couleur.red,
      FlutterI18n.translate(context, 'button.ok'));
}

void showInfoMessage(BuildContext context, String infoMessage) {
  showMessage(
      context,
      infoMessage,
      FlutterI18n.translate(context, 'message.info'),
      Couleur.blue,
      FlutterI18n.translate(context, 'button.ok'));
}

void showSuccessMessage(BuildContext context, String successMessage) {
  showMessage(
      context,
      successMessage,
      FlutterI18n.translate(context, 'messsage.success'),
      Couleur.green,
      FlutterI18n.translate(context, 'button.ok'));
}

void showMessage(BuildContext context, String message, String title,
    Color color, String okButton,
    [String? cancelButton]) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        backgroundColor: color,
        actions: <Widget>[
          if (cancelButton != null)
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(cancelButton),
            ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(okButton),
          ),
        ],
      );
    },
  );
}
