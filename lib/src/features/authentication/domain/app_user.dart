import 'package:uuid/uuid.dart';

class AppUser {
  Uuid id;
  String name;
  String username;
  String email;
  String imageUrl;

  AppUser({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.imageUrl,
  });
}
