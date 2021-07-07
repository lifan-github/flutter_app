import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('登录页'),
              FlatButton(
                child: Text("open new route"),
                textColor: Colors.blue,
                onPressed: (){
                  Navigator.pushReplacementNamed(context, "main_page");
                },
              )
            ]
        ),
      ),
    );
  }
}
