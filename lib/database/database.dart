import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final userCollection = FirebaseFirestore.instance.collection("users");

final FirebaseAuth auth = FirebaseAuth.instance;

final User user = auth.currentUser;
final uid = user.uid;

Future getCurrentUserData() async {
  try {
    DocumentSnapshot ds = await userCollection.doc(uid).get();
    String email = ds.get('email');
    String lokasi = ds.get('lokasi');
    String nama_lengkap = ds.get('nama_lengkap');
    String nomor_hp = ds.get('lokasi');
    return [email,lokasi,nama_lengkap,nomor_hp];
  } catch (e) {
    print(e.toString());
    return null;
  }
}
