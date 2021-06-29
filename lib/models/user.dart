import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.id,
    required this.login,
    required this.nome,
    required this.email,
    required this.urlFoto,
    required this.token,
    required this.roles,
  });

  int id;
  String login;
  String nome;
  String email;
  String urlFoto;
  String token;
  List<String> roles;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        login: json["login"],
        nome: json["nome"],
        email: json["email"],
        urlFoto: json["urlFoto"],
        token: json["token"],
        roles: List<String>.from(json["roles"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "login": login,
        "nome": nome,
        "email": email,
        "urlFoto": urlFoto,
        "token": token,
        "roles": List<dynamic>.from(roles.map((x) => x)),
      };
}
