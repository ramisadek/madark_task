import 'package:flutter/material.dart';
import 'package:madark/services/auth/login_service.dart';

class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneController = TextEditingController();

  TextEditingController passController = TextEditingController();

  FocusNode phoneNode = FocusNode();

  FocusNode passNode = FocusNode();

  bool phoneEmpty=false;

  bool passEmpty = false;

  unFocused(){
    phoneNode.unfocus();
    passNode.unfocus();
  }

  validation(BuildContext context) async{
    if(phoneController.text.isEmpty)
      phoneEmpty=true;
    else
      phoneEmpty=false;
    if(passController.text.isEmpty)
      passEmpty=true;
    else
      passEmpty=false;

    if(!phoneEmpty && ! passEmpty){
      String response = await LoginService().login(phoneController.text, passController.text);
      if(LoginService.status)
      Future.delayed(Duration(seconds: 1),()=> Navigator.pushReplacementNamed(context, '/home'));

      Scaffold.of(context).showSnackBar(SnackBar(content: Text('$response',style: Theme.of(context).textTheme.headline2,)));
    }



    setState(() {});

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF58B6B1),
      appBar: AppBar(
        backgroundColor: Color(0xFF58B6B1),
        title: Text(
          "تسجيل الدخول",
          style: Theme.of(context).textTheme.headline3,
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: Image.asset(
            "assets/icons/next.png",
            scale: 4,
          ),
        )
      ),
      body: Builder(
        builder: (context){
          return GestureDetector(
            onTap: () => unFocused(),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: TextField(
                        controller: phoneController,
                        focusNode: phoneNode,
                        keyboardType: TextInputType.number,
                        style: Theme.of(context).textTheme.headline2,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(4)), borderSide: BorderSide(color: Colors.white)),
                            enabledBorder:
                            OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(4)), borderSide: BorderSide(color: Colors.white)),
                            focusedBorder:
                            OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(4)), borderSide: BorderSide(color: Colors.blue)),

                            hintText: 'رقم الجوال',
                            hintStyle: Theme.of(context).textTheme.headline3.apply(
                                color: Color(0xFFC8E6E5)
                            )
                        ),

                      ),
                    ),
                    if(phoneEmpty==true)
                      Text("من فضلك ادخل رقم الجوال",style: Theme.of(context).textTheme.headline4,),
                    Padding(padding: EdgeInsets.only(top: 20)),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: TextField(
                        controller: passController,
                        focusNode: passNode,
                        style: Theme.of(context).textTheme.headline2,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(4)), borderSide: BorderSide(color: Colors.white)),
                            enabledBorder:
                            OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(4)), borderSide: BorderSide(color: Colors.white)),
                            focusedBorder:
                            OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(4)), borderSide: BorderSide(color: Colors.blue)),

                            hintText: 'كلمة المرور',
                            hintStyle: Theme.of(context).textTheme.headline3.apply(
                                color: Color(0xFFC8E6E5)
                            )
                        ),

                      ),
                    ),
                    if(passEmpty==true)
                      Text("من فضلك ادخل كلمة المرور",style: Theme.of(context).textTheme.headline4,),
                    Padding(padding: EdgeInsets.only(top: 20)),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: MediaQuery.of(context).size.height * 0.075,
                      child: RaisedButton(
                        onPressed: () => validation(context)
                        ,
                        elevation: 2,
                        color: Colors.white,
                        highlightColor: Colors.white,
                        child: Text("تسجيل الدخول",style: Theme.of(context).textTheme.headline1,),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    //TODO:: implement it when the forgetpass endpoint is available
                    InkWell(
                        onTap: () => print('not implemeneted yet'),
                        /// i know that its automatic handled by the font script like safari font
                        /// but the font its self is not provided and tried to download one but it didn`t work
                        child: Text.rich(
                          TextSpan(
                            text: '',
                            style: Theme.of(context).textTheme.headline3,
                            children: <TextSpan>[
                              TextSpan(
                                text: 'نس',
                                style: TextStyle(decoration: TextDecoration.underline),
                              ),
                              TextSpan(
                                text: 'ي',

                              ),
                              TextSpan(
                                text: 'ت كلمه الم',
                                style: TextStyle(decoration: TextDecoration.underline),
                              ),
                              TextSpan(
                                text: 'رور',
                              ),
                              TextSpan(
                                text: '؟',
                                style: TextStyle(decoration: TextDecoration.underline),
                              ),
                              // can add more TextSpans here...
                            ],
                          ),
                        )
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
