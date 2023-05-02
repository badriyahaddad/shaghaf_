import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:shaghaf/providers/artists_provider.dart';
import 'package:shaghaf/providers/artwork_provider.dart';
import 'package:shaghaf/providers/auth_provider.dart';
import 'package:shaghaf/providers/cart_provider.dart';
import 'package:shaghaf/providers/theme_provider.dart';
import 'package:shaghaf/services/screen_router.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
import 'helpers/const.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
//firebase connected
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  //to set the language when changes
  static void setLocale(BuildContext context, Locale locale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state!.setLocale(locale);
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: mainColor));
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //this variable of LOcale type set the langugae the user wants to change to
  Locale _locale = const Locale('ar');
// this function set the language
  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    //provider for the theme of the app
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => ArtworkProvider()),
        ChangeNotifierProvider(create: (context) => ArtistProvider()),
      ],
      //to consume the changes
      child: Consumer<ThemeProvider>(builder: (context, themeConsumer, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            drawerTheme: DrawerThemeData(
              backgroundColor:
                  themeConsumer.isDark ? backgroundColorDark : backgroundColor,
            ),
            //background screen theme
            scaffoldBackgroundColor:
                themeConsumer.isDark ? backgroundColorDark : backgroundColor,
            //appbar theme
            appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(
                    color: themeConsumer.isDark ? Colors.white : Colors.black),
                elevation: 0,
                backgroundColor: Colors.transparent),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: themeConsumer.isDark
                  ? secondrayColorDark.withOpacity(0.5)
                  : secondrayColor.withOpacity(0.5),
              elevation: 0,
            ),
            //text theme
            textTheme: GoogleFonts.ibmPlexSansArabicTextTheme(),

            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          //langugae set up
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'), // English
            Locale('ar'), // Arabic
          ],
          locale: _locale,
          //first screen after splash screen
          home: const ScreenRouter(),
        );
      }),
    );
  }
}
