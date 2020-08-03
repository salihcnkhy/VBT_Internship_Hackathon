import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vbt_hackathon/Core/EnvironmentObjects/EnvironmentObj.dart';

enum CollectionID { User, Category, Categories }

extension CollectionExtension on CollectionID {
  String get id {
    switch (this) {
      case CollectionID.User:
        return "User";
      case CollectionID.Category:
        return "Category";
      case CollectionID.Categories:
        return "Categories";
      default:
        return null;
    }
  }
}

class FirestoreProcess {
  final Firestore _firestore = Firestore.instance;

  Stream<QuerySnapshot> getQuerySnapshot(CollectionID collectionID) {
    return _firestore.collection(collectionID.id).snapshots();
  }

  Stream<DocumentSnapshot> getDocumentSnapshot(
      CollectionID collection, String documentID) {
    return _firestore
        .collection(collection.id)
        .document(documentID)
        .snapshots();
  }

  Stream<DocumentSnapshot> getWordSnapshot(String categoryID) {
    return _firestore
        .collection(CollectionID.User.id)
        .document(EnvironmentObjects().user.uuid)
        .collection(CollectionID.Categories.id)
        .document(categoryID)
        .snapshots();
  }

  Stream<QuerySnapshot> getWordQuerySnapshot() {
    return _firestore
        .collection(CollectionID.User.id)
        .document(EnvironmentObjects().user.uuid)
        .collection(CollectionID.Categories.id)
        .snapshots();
  }

  CollectionReference getCollection(CollectionID collection) {
    return _firestore.collection(collection.id);
  }

  Future<DocumentReference> addUserDocument(Map<String, dynamic> user) {
    return _firestore
        .collection(CollectionID.User.id)
        .document(EnvironmentObjects().user.uuid)
        .setData(user);
  }

  Future<DocumentReference> addWordDocument(
      String categoryID, Map<String, dynamic> word) {
    return _firestore
        .collection(CollectionID.User.id)
        .document(EnvironmentObjects().user.uuid)
        .collection(CollectionID.Categories.id)
        .document(categoryID)
        .setData(word);
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
