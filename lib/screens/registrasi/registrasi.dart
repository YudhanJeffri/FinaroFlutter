import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finaro_project/animation/fadedanimation.dart';
import 'package:finaro_project/model/auth_services.dart';
import 'package:finaro_project/screens/home.dart';
import 'package:finaro_project/screens/login/login.dart';
import 'package:finaro_project/screens/utilities/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

final GlobalKey<State> _LoaderDialog = new GlobalKey<State>();

class RegistrasiPage extends StatefulWidget {
  @override
  _RegistrasiPageState createState() => _RegistrasiPageState();
}

void toast(label) {
  Fluttertoast.showToast(
      msg: label,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER);
}

class _RegistrasiPageState extends State<RegistrasiPage> {
  TextEditingController namaController = new TextEditingController();

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController lokasiController = new TextEditingController();
  TextEditingController nomorhpController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  FadeAnimation(
                      1,
                      Text(
                        "Sign up",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  FadeAnimation(
                      1.2,
                      Text(
                        "Create an account, Join Us",
                        style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                      )),
                ],
              ),
              FadeAnimation(1.3,
                  makeInput(label: "Nama Lengkap", controller: namaController)),
              FadeAnimation(
                  1.4, makeInput(label: "Email", controller: emailController)),
              FadeAnimation(
                  1.5,
                  makeInput(
                      label: "Password",
                      controller: passwordController,
                      obscureText: true)),
              FadeAnimation(1.6,
                  makeInput(label: "Lokasi", controller: lokasiController)),
              FadeAnimation(1.7,
                  makeInput(label: "Nomor Hp", controller: nomorhpController)),
              FadeAnimation(
                1.8,
                Container(
                  padding: EdgeInsets.only(top: 3, left: 3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border(
                        bottom: BorderSide(color: Colors.black),
                        top: BorderSide(color: Colors.black),
                        left: BorderSide(color: Colors.black),
                        right: BorderSide(color: Colors.black),
                      )),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      LoaderDialog.showLoadingDialog(context, _LoaderDialog);
                      final String email = emailController.text.trim();
                      final String password = passwordController.text.trim();
                      final String nama_lengkap = namaController.text.trim();
                      final String lokasi = lokasiController.text.trim();
                      final String nomorhp = nomorhpController.text.trim();
                      try {
                        context
                            .read<AuthService>()
                            .signUp(email, password, nama_lengkap, lokasi,
                                nomorhp, context)
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
                                'nomor_hp': nomorhp
                              })
                              .then(
                                (value) => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()),
                                ),
                              )
                              .catchError((e) => toast(
                                  "Terjadi kesalahan coba lagi nanti \n" + e));
                        });
                      } catch (e) {
                        toast("Terjadi kesalahan coba lagi nanti \n" + e);
                      }
                    },
                    color: Colors.blue,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      "Registrasi",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              FadeAnimation(
                  1.9,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Already have an account?"),
                      MaterialButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                          );
                        },
                        child: Text(
                          "Sign in",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

Widget makeInput({label, obscureText = false, controller}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
      ),
      SizedBox(
        height: 5,
      ),
      TextFormField(
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[400])),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[400])),
        ),
      ),
    ],
  );
}
