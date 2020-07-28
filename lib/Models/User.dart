class User {
  final String uuid;

  User({this.uuid});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    return data;
  }
}
