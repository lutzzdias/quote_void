import 'package:quote_void/src/features/authentication/domain/app_user.dart';
import 'package:quote_void/src/features/category/domain/category.dart';
import 'package:quote_void/src/features/tag/domain/tag.dart';
import 'package:uuid/uuid.dart';

class Quote {
  String id;
  AppUser user;
  String title;
  String content;
  String author;
  DateTime dateTime;
  Category category;
  List<Tag> tags;

  Quote({
    required this.id,
    required this.user,
    required this.title,
    required this.content,
    required this.author,
    required this.dateTime,
    required category,
    tags,
  })  : category = category ??
            Category(
              id: const Uuid().v4(),
              name: 'favorites',
            ),
        tags = tags ?? [];
}
