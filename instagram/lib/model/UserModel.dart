class UserModel {
  final String email;
  final String name;
  final String userName;
  final String description;
  final String link;

  UserModel({
    required this.email,
    required this.name,
    required this.userName,
    required this.description,
    required this.link,
  });

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "name": name,
      "userName": userName,
      "description": description,
      "link": link,
    };
  }
}
