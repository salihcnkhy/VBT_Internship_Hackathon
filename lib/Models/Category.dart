import 'package:cloud_firestore/cloud_firestore.dart';

class Category {
  String url;
  String title;
  String image;
  String id;
  final DocumentReference reference;
  Category.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['url'] != null),
        assert(map['title'] != null),
        title = map['title'],
        image = map['image'],
        id = map['id'],
        url = map['url'];

  Category.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);
}
