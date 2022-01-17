import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finaro_project/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final GlobalKey<State> _LoaderDialog = new GlobalKey<State>();

class AuthService {
  final FirebaseAuth _auth;

  AuthService(this._auth);

  Stream<User> get authStateChanges => _auth.idTokenChanges();

  Future<String> login(String email, String password, context) async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              ))
          .catchError((err) {
        Navigator.of(context, rootNavigator: true).pop();
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Error"),
                content: Text(err.message),
                actions: [
                  ElevatedButton(
                    child: Text("Ok"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            });
      });
      return "Logged in";
    } catch (e) {
      return e;
    }
  }

  Future<String> signUp(String email, String password, String nama_lengkap,
      String lokasi, String nomor_hp, context) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
            User user = FirebaseAuth.instance.currentUser;

            await FirebaseFirestore.instance
                .collection("users")
                .doc(user.uid)
                .set({
              'uid': user.uid,
              'nama_lengkap': nama_lengkap,
              'email': email,
              'password': password,
              'lokasi': lokasi,
              'nomor_hp': nomor_hp,
            });
          })
          .then((value) => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              ))
          .catchError((err) {
            Navigator.of(context, rootNavigator: true).pop();
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Error"),
                    content: Text(err.message),
                    actions: [
                      ElevatedButton(
                        child: Text("Ok"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  );
                });
          });
      return "Signed Up";
    } catch (e) {
      return e;
    }
  }
}
