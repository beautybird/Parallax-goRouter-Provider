
import 'package:password_dart/password_dart.dart';


class PasswordSecure {
  final PBKDF2? algorithm = PBKDF2(
    blockLength: 24,
    iterationCount: 3000,
    desiredKeyLength: 16,
    salt: null,
  );

  PasswordSecure();

  String? hashedPass;
  String? hash(String? userPass) {
    hashedPass = Password.hash(userPass!, algorithm!);
    return hashedPass;
  }

  bool? verified;
  bool? verify(String? userInserted, String? savedPass) {
    verified = Password.verify(userInserted!, savedPass!);
    return verified;
  }
}
