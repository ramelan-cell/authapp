import 'package:authapp/api/google_sign_api.dart';
import 'package:authapp/page/login.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                  onPressed: signIn,
                  icon: FaIcon(
                    FontAwesomeIcons.google,
                    color: Colors.red,
                  ),
                  label: Text('Sign up with google'))
            ],
          ),
        ),
      ),
    );
  }

  Future signIn() async {
    final user = await GoogleSignInApi.login();

    if (user == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Sign in falide')));
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoggedInPage(user: user)));
    }
  }
}
