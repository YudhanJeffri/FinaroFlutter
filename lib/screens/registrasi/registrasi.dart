import 'package:finaro_project/screens/home.dart';
import 'package:finaro_project/screens/registrasi/form_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegistrasiPage extends StatefulWidget {
  @override
  _RegistrasiPageState createState() => _RegistrasiPageState();
}

bool validateStructure(String value) {
  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regExp = new RegExp(pattern);
  return regExp.hasMatch(value);
}

var passwordController = TextEditingController();
String _passwordError;
void toastPassword(label) {
  Fluttertoast.showToast(
      msg: label,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER);
}

class _RegistrasiPageState extends State<RegistrasiPage> {
  String _email, _password;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(hintText: 'Email'),
              onChanged: (value) {
                setState(() {
                  _email = value.trim();
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                  hintText: 'Password', errorText: _passwordError),
              onChanged: (value) {
                setState(() {
                  _password = value.trim();
                });
              },
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            ElevatedButton(
                child: Text('Signin'),
                onPressed: () {
                  auth
                      .signInWithEmailAndPassword(
                          email: _email, password: _password)
                      .then((_) {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => HomePage()));
                  });
                }),
            ElevatedButton(
              child: Text('Signup'),
              onPressed: () {
                final String password = passwordController.text.trim();
                if (password.isEmpty) {
                  toastPassword("Password tidak boleh kosong");
                  _passwordError = "Password tidak boleh kosong";
                } else if (password.length <= 6) {
                  _passwordError =
                      "Password tidak boleh kurang dari sama dengan 6";
                  toastPassword(
                      "Password tidak boleh kurang dari sama dengan 6");
                } else {
                  auth
                      .createUserWithEmailAndPassword(
                          email: _email, password: _password)
                      .then((_) {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => FormPage()));
                  });
                }
              },
            )
          ]),
        ],
      ),
    );
  }
}
