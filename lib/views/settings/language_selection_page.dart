import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

class LanguageSelectionPage extends StatefulWidget {
  const LanguageSelectionPage({super.key});

  @override
  State<LanguageSelectionPage> createState() => _LanguageSelectionPageState();
}

class _LanguageSelectionPageState extends State<LanguageSelectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(FlutterI18n.translate(context, "language.choose_language")),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                await FlutterI18n.refresh(context, const Locale('en'));
                setState(() {});
              },
              child: Text(FlutterI18n.translate(context, "language.english")),
            ),
            ElevatedButton(
              onPressed: () async {
                await FlutterI18n.refresh(context, const Locale('fr'));
                setState(() {});
              },
              child: Text(FlutterI18n.translate(context, "language.french")),
            ),
            ElevatedButton(
              onPressed: () async {
                await FlutterI18n.refresh(context, const Locale('es'));
                setState(() {});
              },
              child: Text(FlutterI18n.translate(context, "language.spanish")),
            ),
          ],
        ),
      ),
    );
  }
}
