import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Firebase {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<QuerySnapshot> getQuerySnapshot(String collectionID) {
    return Firestore.instance.collection(collectionID).snapshots();
  }

  Future<FirebaseUser> login(String email, String password) async {
    final FirebaseUser user = (await _auth.signInWithEmailAndPassword(
            email: email, password: password))
        .user;
    return user;
  }

  Future<FirebaseUser> register(String email, String password) async {
    final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
            email: email, password: password))
        .user;
    return user;
  }
}
