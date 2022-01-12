import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth;

  AuthService(this._auth);

  Stream<User> get authStateChanges => _auth.idTokenChanges();

  Future<String> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return "Logged In";
    } catch (e) {
      return e;
    }
  }

  Future<String> signUp(String email, String password,String nama_lengkap, String lokasi,String nomor_hp) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        User user = FirebaseAuth.instance.currentUser;

        await FirebaseFirestore.instance.collection("users").doc(user.uid).set({
          'uid': user.uid,
          'nama_lengkap' : nama_lengkap,
          'email': email,
          'password': password,
          'lokasi' : lokasi,
          'nomor_hp' : nomor_hp,
        });
      });
      return "Signed Up";
    } catch (e) {
      return e;
    }
  }
}
