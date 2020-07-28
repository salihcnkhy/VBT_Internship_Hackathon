import 'package:uuid/uuid.dart';

class UuidGen {
  static final UuidGen _singleton = UuidGen._internal();
  UuidGen._internal();
  factory UuidGen() {
    return _singleton;
  }
  String generateUUID() {
    return Uuid().v1();
  }
}
