class User {
  User(
      {required this.id,
      required this.name,
      required this.avatarURL,
      required this.active});
  String id;
  String name;
  String avatarURL;
  bool active;
  factory User.fromJson(dynamic json) {
    return User(
        id: json['id'] as String,
        name: json['name'] as String,
        avatarURL: json['name'] as String,
        active: json['active'] as bool);
  }
}

class UserAttends {
  String nickname;
  String id;
  UserAttends({required this.nickname, required this.id});

  factory UserAttends.fromJson(dynamic json) {
    return UserAttends(nickname: json['nickname'], id: json['id']);
  }
}
