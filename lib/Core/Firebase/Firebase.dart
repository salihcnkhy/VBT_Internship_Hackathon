import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreProcess {
  final Firestore _firestore = Firestore.instance;

  Stream<QuerySnapshot> getQuerySnapshot(String collectionID) {
    return _firestore.collection(collectionID).snapshots();
  }

  Future<DocumentReference> addDocument(
      String collectionID, Map<String, dynamic> data) {
    return _firestore.collection(collectionID).add(data);
  }
}

class FirebaseAuthProcess {
  final FirebaseAuth _auth = FirebaseAuth.instance;

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

  Future<FirebaseUser> checkUser() async {
    final FirebaseUser user = (await _auth.currentUser());
    return user;
  }
}
