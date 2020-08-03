import 'package:cloud_firestore/cloud_firestore.dart';

class Category {
  String url;
  String title;
  String image;
  String id;
  String definition;
  final DocumentReference reference;
  Category.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['url'] != null),
        assert(map['title'] != null),
        assert(map['definition'] != null),
        assert(map['id'] != null),
        title = map['title'],
        image = map['image'],
        definition = map['definition'],
        id = map['id'],
        url = map['url'];

  Category.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);
}
