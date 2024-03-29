    
import 'dart:convert';

Jugador jugadorFromJson(String str) {
  final jsonData = json.decode(str);
  return Jugador.fromMap(jsonData);
}

String jugadorToJson(Jugador data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class Jugador {
  int id;
  String nombres;
  String apellidos;
  String correo;
  String celular;

  Jugador({
    this.id,
    this.nombres,
    this.apellidos,
    this.correo,
    this.celular
  });

  factory Jugador.fromMap(Map<String, dynamic> json) => new Jugador(
        id: json["id"],
        nombres: json["nombres"],
        apellidos: json["apellidos"],
        correo: json["correo"],
        celular: json["celular"]
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nombres": nombres,
        "apellidos": apellidos,
        "correo": correo,
        "celular": celular,
      };
}