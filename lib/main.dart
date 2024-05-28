import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flymenu/styles.dart';
import 'package:flymenu/views/settings/language_selection_page.dart';

  Future<void> main() async {

    runApp(const MainView());
  }

  class MainView extends StatelessWidget {
    const MainView({super.key});

    @override
    Widget build(BuildContext context) {
      
      return MaterialApp(
          localizationsDelegates: [
            FlutterI18nDelegate(
              translationLoader: FileTranslationLoader(
                basePath: "assets/flutter_i18n",
                fallbackFile: 'en',
                useCountryCode: false,
              ),
              missingTranslationHandler: (key, locale) {
                if (kDebugMode) {
                  print('I18n --- Missing Key: $key, '
                      'languageCode: ${locale?.languageCode}');
                }
              },
            ),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'),
            Locale('es'),
            Locale('fr'),
          ],
          home: const LanguageSelectionPage(),
          theme: Themes.darkTheme,);
    }
  }

// class MainContentView extends StatefulWidget {
//   const MainContentView({super.key});

//   @override
//   State<MainContentView> createState() => _MainContentViewState();
// }

// class _MainContentViewState extends State<MainContentView> {
//   @override
//   Widget build(BuildContext context) {
//     return const Navbar();
//   }
// }
