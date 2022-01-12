import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finaro_project/screens/dashboard/dashboard.dart';
import 'package:finaro_project/screens/login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

final FirebaseAuth auth = FirebaseAuth.instance;

final User cruser = auth.currentUser;
final uid = user.uid;
final nama = user.displayName;
final userCollection = FirebaseFirestore.instance.collection("users");

final User user = auth.currentUser;

String email;
String lokasi;
String nama_lengkap;
String nomor_hp;

class _ProfilePageState extends State<ProfilePage> {
  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');
  String name = "Nama Loading...";
  String lokasi = "Lokasi Loading...";
  String nomor_hp = "Nomor Hp Loading...";
  String email = "Email Loading...";

  void getData() async {
    User user = await FirebaseAuth.instance.currentUser;
    var vari = await FirebaseFirestore.instance
        .collection("users")
        .doc(user.uid)
        .get();
    setState(() {
      name = vari.data()['nama_lengkap'];
      lokasi = vari.data()['lokasi'];
      nomor_hp = vari.data()['nomor_hp'];
      email = vari.data()['email'];
    });
  }

  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    icon: Icon(Icons.settings),
                    onPressed: () {
                      showAlertDialogLogout(context);
                    }),
              ],
            ),
            Container(
              margin: EdgeInsets.only(bottom: 11),
              alignment: Alignment.center, // This is needed
              child: Image.asset(
                'assets/images/profileavatar.png',
                width: 100,
              ),
            ),
            Center(
              child: Text(
                name,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 4),
                  alignment: Alignment.center, // This is needed
                  child: Image.asset(
                    'assets/images/icon_fire.png',
                    width: 17,
                  ),
                ),
                Text("Poin 30",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500))
              ],
            ),
            Container(
                margin: EdgeInsets.only(top: 25),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Nama Lengkap",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500)),
                      Text(name,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500)),
                      Divider(thickness: 4, color: HexColor('#C4C4C4')),
                      Container(
                        margin: EdgeInsets.only(top: 14.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Nomor Ponsel ",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500)),
                            Row(
                              children: [
                                IconButton(
                                  icon: Image.asset('assets/images/flag.png'),
                                  onPressed: () {},
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 12),
                                  child: Text(nomor_hp,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500)),
                                ),
                              ],
                            ),
                            Divider(thickness: 4, color: HexColor('#C4C4C4')),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 14.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Email",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500)),
                            Text(email,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500)),
                            Divider(thickness: 4, color: HexColor('#C4C4C4')),
                          ],
                        ),
                      ),
                      Text("Akun Yang Terhubung",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500)),
                      Container(
                        margin: EdgeInsets.only(top: 11.0),
                        child: Row(
                          children: [
                            Icon(Icons.facebook,
                                size: 30, color: HexColor('#45619D')),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Text("Facebook",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 11.0),
                        child: Row(
                          children: [
                            Icon(Icons.add, size: 30),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Text("Tambah Akun",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 6,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              HexColor('#C4C4C4')),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ))),
                                  child: Text(
                                    "Tentang Kami",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                )),
                            Expanded(
                              flex: 1,
                              child: SizedBox(height: 1),
                            ),
                            Expanded(
                                flex: 6,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              HexColor('#C4C4C4')),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ))),
                                  child: Text("Customer Service",
                                      style: TextStyle(color: Colors.black)),
                                ))
                          ],
                        ),
                      )
                    ]))
          ],
        ),
      ),
    );
  }
}

showAlertDialogLogout(BuildContext context) {
  final auth = FirebaseAuth.instance;
  // set up the button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
      auth.signOut();
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginPage()));
    },
  );
  Widget cancelButton = TextButton(
    child: Text("Cancel"),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Logout"),
    content: Text("Beneran Ingin Logout?"),
    actions: [cancelButton, okButton],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
