import 'package:finaro_project/screens/login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
              'assets/images/profile.png',
              width: 100,
            ),
          ),
          Center(
            child: Text(
              "Hartanto",
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
                    Text("Hartanto",
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
                                child: Text("+62-8260-4470-216",
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
                          Text("hartantooye@gmail.com",
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
                                    fontSize: 20, fontWeight: FontWeight.w500)),
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
                                    fontSize: 20, fontWeight: FontWeight.w500)),
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
                                      borderRadius: BorderRadius.circular(10.0),
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
                                      borderRadius: BorderRadius.circular(10.0),
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
