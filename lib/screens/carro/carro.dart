import 'dart:convert';

Carro carroFromMap(String str) => Carro.fromMap(json.decode(str));

String carroToMap(Carro data) => json.encode(data.toMap());

class Carro {
  Carro({
    required this.id,
    required this.nome,
    required this.tipo,
    required this.descricao,
    required this.urlFoto,
    required this.urlVideo,
    required this.latitude,
    required this.longitude,
  });

  int id;
  String nome;
  String tipo;
  String descricao;
  String urlFoto;
  String urlVideo;
  String latitude;
  String longitude;

  factory Carro.fromMap(Map<String, dynamic> json) => Carro(
        id: json["id"],
        nome: json["nome"],
        tipo: json["tipo"],
        descricao: json["descricao"],
        urlFoto: json["urlFoto"],
        urlVideo: json["urlVideo"],
        latitude: json["latitude"],
        longitude: json["longitude"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nome": nome,
        "tipo": tipo,
        "descricao": descricao,
        "urlFoto": urlFoto,
        "urlVideo": urlVideo,
        "latitude": latitude,
        "longitude": longitude,
      };
}
