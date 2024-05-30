import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flymenu/constants/languages.constant.dart';

class LanguageDropdown extends StatefulWidget {
  const LanguageDropdown({super.key});

  @override
  State<LanguageDropdown> createState() => _LanguageDropdownState();
}

class _LanguageDropdownState extends State<LanguageDropdown> {
  String _currentLanguage = LanguagesConstant.currentLanguage;
  final List<String> _languages = LanguagesConstant.languages;

  void _changeLanguage(String language) async {
    await FlutterI18n.refresh(context, Locale(language));
    setState(() {_currentLanguage = language;});
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: _currentLanguage,
      icon: const Icon(Icons.language),
      iconSize: 24,
      elevation: 16,
      underline: Container(
        height: 2,
      ),
      onChanged: (String? newValue) {
        if (newValue != null) {
          _changeLanguage(newValue);
        }
      },
      items: _languages.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(FlutterI18n.translate(context, "language.$value")),
        );
      }).toList(),
    );
  }
}
