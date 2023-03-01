class AppUser {
  String id;
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

  Map<String, dynamic> toMap() => {
        'name': name,
        'username': username,
        'email': email,
        'imageUrl': imageUrl,
      };
}
