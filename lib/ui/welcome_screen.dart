import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    "assets/icons/logo.png",
                    scale: 3,
                  ),
                  Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 30)),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      padding: EdgeInsets.symmetric(vertical: 7),
                      color: Color(0xFF58B6B1),
                      alignment: Alignment.center,
                      child: Text(
                        "تسجيل الدخول",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top)),
                  InkWell(
                    //TODO:: implemented the registration
                    onTap: () => print('not implemented yet'),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      padding: EdgeInsets.symmetric(vertical: 7),
                      color: Color(0xFF58B6B1),
                      alignment: Alignment.center,
                      child: Text(
                        "تسجيل الاشتراك",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top)),
                  //TODO:: implemented the forget password
                  InkWell(
                      onTap: () => print('not implemented yet'),

                      /// i know that its automatic handled by the font script like safari font
                      /// but the font its self is not provided and tried to download one but it didn`t work
                      child: Text.rich(
                        TextSpan(
                          text: '',
                          style: Theme.of(context).textTheme.headline1,
                          children: <TextSpan>[
                            TextSpan(
                              text: 'الدخ',
                              style: TextStyle(decoration: TextDecoration.underline),
                            ),
                            TextSpan(
                              text: 'ول',
                            ),
                            TextSpan(
                              text: ' ك',
                              style: TextStyle(decoration: TextDecoration.underline),
                            ),
                            TextSpan(
                              text: 'ز',
                            ),
                            TextSpan(
                              text: 'ائ',
                              style: TextStyle(decoration: TextDecoration.underline),
                            ),
                            TextSpan(
                              text: 'ر',
                            ),
                            // can add more TextSpans here...
                          ],
                        ),
                      )),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Image.asset("assets/icons/bottom_shape_login.png"),
            ),
          ],
        ),
      ),
    );
  }
}
