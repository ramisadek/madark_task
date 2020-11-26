import 'package:flutter/material.dart';
import 'package:madark/ui/home_screen.dart';
import 'package:madark/ui/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  String token;

  getToken() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("access_token")??"";
  }

  goToScreen() async{

    await getToken();

    Future.delayed(Duration(milliseconds: 500),(){
      if(token.isEmpty)
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, _, __) => WelcomeScreen(),
            transitionDuration: Duration(seconds: 1,milliseconds: 500),
            transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
              opacity: animation,
              child: child,
            ),
          ),
        );
      else
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, _, __) => HomeScreen(),
            transitionDuration: Duration(seconds: 1,milliseconds: 500),
            transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
              opacity: animation,
              child: child,
            ),
          ),
        );
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    goToScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("assets/icons/logo.png",scale: 5,),
      ),
    );
  }
}
