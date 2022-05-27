// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthService{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> sigin(String, email, String password) async {
    var user = await _auth.signInWithEmailAndPassword(email: email, password: password);
        return user.user;
  } //"Giriş yap fonksiyonu "
  signout() async {
    return await _auth.signOut();
  }// "Çıkış yap fonksiyonu"

Future<User?> createPerson(String name, String email, int phonenumb, String password) async{
    var user = await _auth.createUserWithEmailAndPassword(email: email, password: password);

    await _firestore
    .collection("Person")
    .doc(user.user?.uid)
    .set({
      "UserName" : name,
      "email" :email,
    });

 return user.user;
}

}
