import 'package:authapp/api/google_sign_api.dart';
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
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                child: Image.network(
                  widget.user.photoUrl ?? '',
                  width: 150,
                  height: 150,
                ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final userlogut = await GoogleSignInApi.logout();

          print(userlogut);
        },
        child: Icon(Icons.close),
      ),
    );
  }
}
