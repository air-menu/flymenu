import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flymenu/Services/categories_services.dart';
import 'package:flymenu/ViewModel/categories_view_model.dart';
import 'package:flymenu/ViewModel/products_view_model.dart';
import 'package:flymenu/Views/menu_widget.dart';
import 'package:flymenu/pages/parameters/language_selection_page.dart';
import 'package:flymenu/styles.dart';
import 'package:flymenu/services/auth/user_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flymenu/firebase_options.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MainView());
}

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  ThemeData _currentTheme = Themes.lightTheme;

  void _toggleTheme() {
    setState(() {
      _currentTheme = _currentTheme.brightness == Brightness.dark
          ? Themes.lightTheme
          : Themes.darkTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => CategoriesService()),
        ChangeNotifierProvider(create: (context) => CategoriesViewModel()),
        ChangeNotifierProvider(create: (context) => ProductsViewModel())
      ],
      child: MaterialApp(
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
        home: UserAuth(),
        // Changer le thème actuel ici
        theme: _currentTheme,
        // Ajouter un bouton pour changer le thème
        builder: (context, child) {
          return Scaffold(
            bottomNavigationBar: SizedBox(
              height: 100,
              child: AppBar(
                actions: [
                  IconButton(
                    icon: Icon(_currentTheme.brightness == Brightness.dark
                        ? Icons.wb_sunny
                        : Icons.nights_stay),
                    onPressed: _toggleTheme,
                  ),
                  IconButton(
                      onPressed: () => {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const LanguageSelectionPage()))
                      },
                      icon: const Icon(Icons.language_sharp))
                ],
              ),
            ),
            body: child,
          );
        },
      ),
    );
  }
}

class MainContentView extends StatefulWidget {
  const MainContentView({super.key});

  @override
  State<MainContentView> createState() => _MainContentViewState();
}

class _MainContentViewState extends State<MainContentView> {
  @override
  Widget build(BuildContext context) {
    return const MenuWidget();
  }
}
