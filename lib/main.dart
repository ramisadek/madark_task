import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:madark/ui/home_screen.dart';
import 'package:madark/ui/login_screeen.dart';
import 'package:madark/ui/welcome_screen.dart';
import 'package:madark/ui/splash_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      theme:
      ThemeData(
        primaryColor: Color(0xFF58B6B1),
        fontFamily: 'coText',
        textTheme:  TextTheme(
          headline1: TextStyle(fontSize: 20.0, color: Color(0xFF58B6B1)),
          headline2: TextStyle(fontSize: 20.0, color: Colors.white),
          headline3: TextStyle(fontSize: 16.0, color: Colors.white,),
          headline4: TextStyle(fontSize: 15.0, color: Colors.red,),
        ).apply(
          fontSizeFactor: 1.0,
          fontFamily: 'coText',
        ),
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("en", "US"),
        Locale("ar", ""),
      ],
      locale: Locale("ar"),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/welcome':(context) => WelcomeScreen(),
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
