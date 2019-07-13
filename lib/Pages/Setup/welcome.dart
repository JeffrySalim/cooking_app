import 'package:cooking_app/Pages/Setup/signIn.dart';
import 'package:cooking_app/Pages/Setup/signUp.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children : [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/photo/welcome.jpeg"),
            fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text("Cooking FUN!!!"),
            backgroundColor: Colors.lightBlue,
            elevation: 0,
          ),
          body: Padding(padding: EdgeInsets.all(0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              RaisedButton(
                onPressed: navigateToSignIn,
                color: Colors.white,
                child: Text('Sign In'),
              ),
              RaisedButton(
                onPressed: navigateToSignUp,
                color: Colors.white,
                child: Text('Sign Up'),
              )
            ],
          ),
          ),
        )
      ]
    );
  }

  void navigateToSignIn() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginPage(), fullscreenDialog: true));
  }

  void navigateToSignUp() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SignUpPage(), fullscreenDialog: true));
  }
}

