import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flymenu/ViewModel/shop_view_model.dart';
import 'package:flymenu/ViewModel/theme_view_model.dart';
import 'package:flymenu/ViewModel/categories_view_model.dart';
import 'package:flymenu/ViewModel/products_view_model.dart';
import 'package:flymenu/services/categories_services.dart';
import 'package:flymenu/services/auth/user_auth.dart';
import 'package:flymenu/components/navbar/navbar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flymenu/services/firebase_options.dart';
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

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => CategoriesService()),
        ChangeNotifierProvider(create: (context) => ThemeViewModel()),
        ChangeNotifierProvider(create: (context) => CategoriesViewModel()),
        ChangeNotifierProvider(create: (context) => ProductsViewModel()),
        ChangeNotifierProvider(create: (context) => ShopViewModel())
      ],
      child: Consumer<ThemeViewModel>(
          builder: (context, themeViewModel, child) {
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
              home: UserAuth(),
              theme: themeViewModel.currentTheme,
            );
          }
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
    return const Navbar();
  }
}
