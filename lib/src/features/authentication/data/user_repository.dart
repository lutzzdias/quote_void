import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_void/src/features/authentication/domain/app_user.dart';

class UserRepository {
  final FirebaseFirestore _firestore;

  const UserRepository(this._firestore);

  static String userPath(String id) => 'users/$id';
  static String get usersPath => 'users/';

  Future<void> createUser({required AppUser user}) =>
      _firestore.collection(usersPath).add(user.toMap());
}

final userRepositoryProvider =
    Provider((ref) => UserRepository(FirebaseFirestore.instance));
