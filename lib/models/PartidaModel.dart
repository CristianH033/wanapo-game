    
import 'dart:convert';

Partida partidaFromJson(String str) {
  final jsonData = json.decode(str);
  return Partida.fromMap(jsonData);
}

String partidaToJson(Partida data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class Partida {
  int id;
  int jugadorId;
  
  Partida({
    this.id,
    this.jugadorId
  });

  factory Partida.fromMap(Map<String, dynamic> json) => new Partida(
        id: json["id"],
        jugadorId: json["jugador_id"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "jugador_id": jugadorId
      };
}