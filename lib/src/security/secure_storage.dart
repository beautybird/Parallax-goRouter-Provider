
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppSecureStorage{

  FlutterSecureStorage? storage;

  AppSecureStorage() {
    storage = const FlutterSecureStorage(); // 1
  }
}