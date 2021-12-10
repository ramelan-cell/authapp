import 'package:authapp/api/google_sign_api.dart';
import 'package:authapp/page/signup.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoggedInPage extends StatefulWidget {
  final GoogleSignInAccount user;
  LoggedInPage({this.user});

  @override
  _LoggedInPageState createState() => _LoggedInPageState();
}

class _LoggedInPageState extends State<LoggedInPage> {
  @override
  void initState() {
    // TODO: implement initState
    print(widget.user);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(fontSize: 14.0),
        ),
        actions: [
          IconButton(
              onPressed: () async {
                final userlogut = await GoogleSignInApi.logout();

                if (userlogut == null) {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Login()));
                }

                print(userlogut);
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                widget.user.photoUrl ??
                    'https://irs3.4sqi.net/img/user/original/HBVX4T2WQOGG20FE.png',
                width: 250,
                height: 250,
              ),
              SizedBox(
                height: 10,
              ),
              Text('Nama ' + widget.user.displayName ?? ''),
              SizedBox(
                height: 10,
              ),
              Text('Email ' + widget.user.email ?? ''),
            ],
          ),
        ),
      ),
    );
  }
}
