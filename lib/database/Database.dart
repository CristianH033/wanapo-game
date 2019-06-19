import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wanapo_game/models/JugadorModel.dart';
import 'package:wanapo_game/models/PartidaModel.dart';
import 'package:wanapo_game/models/PreguntaModel.dart';
import 'package:wanapo_game/models/RespuestaModel.dart';
import 'package:wanapo_game/models/RespuestasPartidaModel.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "wanapo.db");
    return await openDatabase(
      path, 
      version: 1, 
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute(
           "CREATE TABLE 'jugador'"
            "("
            " 'id'               INTEGER PRIMARY KEY,"
            " 'nombres'    varchar(255) NOT NULL ,"
            " 'apellidos'  varchar(255) NOT NULL ,"
            " 'fecha_creacion'   datetime NOT NULL"
            ")"
        );

        await db.execute(
            "CREATE TABLE 'partidas'"
            "("
            " 'id'         INTEGER PRIMARY KEY,"
            " 'jugador_id' integer NOT NULL ,"
            " FOREIGN KEY ('jugador_id') REFERENCES 'jugador' ('id')"
            ")"
        );

        await db.execute(
            "CREATE TABLE 'preguntas'"
            "("
            " 'id'      INTEGER PRIMARY KEY,"
            " 'texto'   varchar(255) NOT NULL ,"
            " 'puntaje' integer NOT NULL"
            ")"
        );

        await db.execute(
            "CREATE TABLE 'respuestas'"
            "("
            " 'id'          INTEGER PRIMARY KEY,"
            " 'texto'       varchar(255) NOT NULL ,"
            " 'correcta'    BIT,"
            " 'pregunta_id' integer NOT NULL ,"
            " FOREIGN KEY ('pregunta_id') REFERENCES 'preguntas' ('id')"
            ")"
        );

        await db.execute(
            "CREATE TABLE 'respuestas_partida'"
            "("
            " 'partida_id'   integer NOT NULL ,"
            " 'respuesta_id' integer NOT NULL ,"
            " 'fecha'        datetime NOT NULL ,"
            " FOREIGN KEY ('partida_id') REFERENCES 'partidas' ('id'),"
            " FOREIGN KEY ('respuesta_id') REFERENCES 'respuestas' ('id')"
            ")"
        );

        await db.execute(
            "INSERT INTO jugador"
            "(id, nombres, apellidos, fecha_creacion)"
            "VALUES(1057015139, 'Cristian', 'Home', 0)"
        );

        await db.execute(
            "INSERT INTO preguntas"
            "(id, texto, puntaje)"
            "VALUES (1, 'Pregunta 1', 1),"
            "(2, 'Pregunta 2', 1),"
            "(3, 'Pregunta 3', 1),"
            "(4, 'Pregunta 4', 1),"
            "(5, 'Pregunta 5', 1),"
            "(6, 'Pregunta 6', 1),"
            "(7, 'Pregunta 7', 1),"
            "(8, 'Pregunta 8', 1),"
            "(9, 'Pregunta 9', 1),"
            "(10, 'Pregunta 10', 1)"
        );

        await db.execute(
            "INSERT INTO respuestas"
            "(id, texto, correcta, pregunta_id)"
            "VALUES (1, 'Respuesta 1', 0, 1),"
            "(2, 'Respuesta 2', 0, 1),"
            "(3, 'Respuesta 3', 0, 1),"
            "(4, 'Respuesta 4', 1, 1),"
            "(5, 'Respuesta 1', 0, 2),"
            "(6, 'Respuesta 2', 0, 2),"
            "(7, 'Respuesta 3', 0, 2),"
            "(8, 'Respuesta 4', 1, 2),"
            "(9, 'Respuesta 1', 0, 3),"
            "(10, 'Respuesta 2', 0, 3),"
            "(11, 'Respuesta 3', 0, 3),"
            "(12, 'Respuesta 4', 1, 3),"
            "(13, 'Respuesta 1', 0, 4),"
            "(14, 'Respuesta 2', 0, 4),"
            "(15, 'Respuesta 3', 0, 4),"
            "(16, 'Respuesta 4', 1, 4),"
            "(17, 'Respuesta 1', 0, 5),"
            "(18, 'Respuesta 2', 0, 5),"
            "(19, 'Respuesta 3', 0, 5),"
            "(20, 'Respuesta 4', 1, 5),"
            "(21, 'Respuesta 1', 0, 6),"
            "(22, 'Respuesta 2', 0, 6),"
            "(23, 'Respuesta 3', 0, 6),"
            "(24, 'Respuesta 4', 1, 6),"
            "(25, 'Respuesta 1', 0, 7),"
            "(26, 'Respuesta 2', 0, 7),"
            "(27, 'Respuesta 3', 0, 7),"
            "(28, 'Respuesta 4', 1, 7),"
            "(29, 'Respuesta 1', 0, 8),"
            "(30, 'Respuesta 2', 0, 8),"
            "(31, 'Respuesta 3', 0, 8),"
            "(32, 'Respuesta 4', 1, 8),"
            "(33, 'Respuesta 1', 0, 9),"
            "(34, 'Respuesta 2', 0, 9),"
            "(35, 'Respuesta 3', 0, 9),"
            "(36, 'Respuesta 4', 1, 9),"
            "(37, 'Respuesta 1', 0, 10),"
            "(38, 'Respuesta 2', 0, 10),"
            "(39, 'Respuesta 3', 0, 10),"
            "(40, 'Respuesta 4', 1, 10)"
        );
      }
    );
  }

  // Jugador
  newJugador(Jugador newJugador) async {
    final db = await database;
    var raw = await db.rawInsert(
        "INSERT Into jugadores (id, nombres, apellidos)"
        " VALUES (?,?,?)",
        [newJugador.id, newJugador.nombres, newJugador.apellidos]);
    return raw;
  }
  // newEstado(Estado newEstado) async {
  //   final db = await database;
  //   //get the biggest id in the table
  //   var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM Estado");
  //   int id = table.first["id"];
  //   //insert to the table using the new id
  //   var raw = await db.rawInsert(
  //       "INSERT Into Estado (id,nombre,icono)"
  //       " VALUES (?,?,?)",
  //       [id, newEstado.nombre, newEstado.icono]);
  //   return raw;
  // }

  updateJugador(Jugador newJugador) async {
    final db = await database;
    var res = await db.update("jugadores", newJugador.toMap(),
        where: "id = ?", whereArgs: [newJugador.id]);
    return res;
  }

  getJugador(int id) async {
    final db = await database;
    var res = await db.query("jugadores", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? Jugador.fromMap(res.first) : null;
  }

  Future<List<Jugador>> getAllJugadores() async {
    final db = await database;
    var res = await db.query("jugadores");
    List<Jugador> list = res.isNotEmpty ? res.map((c) => Jugador.fromMap(c)).toList() : [];
    return list;
  }

  deleteJugador(int id) async {
    final db = await database;
    return db.delete("jugadores", where: "id = ?", whereArgs: [id]);
  }

  deleteAllJugador() async {
    final db = await database;
    db.rawDelete("Delete * from jugadores");
  }

  // Preguntas
  // newPerfil(Perfil newPerfil) async {
  //   final db = await database;
  //   //get the biggest id in the table
  //   var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM Perfil");
  //   int id = table.first["id"];
  //   //insert to the table using the new id
  //   var raw = await db.rawInsert(
  //       "INSERT Into Perfil (id, nombre)"
  //       " VALUES (?,?)",
  //       [id, newPerfil.nombre]);
  //   return raw;
  // }

  // updatePerfil(Perfil newPerfil) async {
  //   final db = await database;
  //   var res = await db.update("Perfil", newPerfil.toMap(),
  //       where: "id = ?", whereArgs: [newPerfil.id]);
  //   return res;
  // }

  getPregunta(int id) async {
    final db = await database;
    var res = await db.query("preguntas", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? Pregunta.fromMap(res.first) : null;
  }

  Future<List<Pregunta>> getAllPreguntas() async {
    final db = await database;
    var res = await db.query("preguntas");
    List<Pregunta> list = res.isNotEmpty ? res.map((c) => Pregunta.fromMap(c)).toList() : [];
    return list;
  }

  // deletePerfil(int id) async {
  //   final db = await database;
  //   return db.delete("Perfil", where: "id = ?", whereArgs: [id]);
  // }

  // deleteAllPerfil() async {
  //   final db = await database;
  //   db.rawDelete("Delete * from Perfil");
  // }

  // Respuestas
  getRespuesta(int id) async {
    final db = await database;
    var res = await db.query("respuestas", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? Respuesta.fromMap(res.first) : null;
  }

  Future<List<Respuesta>> getAllRespuestas() async {
    final db = await database;
    var res = await db.query("respuestas");
    List<Respuesta> list = res.isNotEmpty ? res.map((c) => Pregunta.fromMap(c)).toList() : [];
    return list;
  }

  // Partidas
  newPartida(Partida newPartida) async {
    final db = await database;
    //get the biggest id in the table
    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM partidas");
    int id = table.first["id"];
    //insert to the table using the new id
    var raw = await db.rawInsert(
        "INSERT Into partidas (id, jugador_id)"
        " VALUES (?,?)",
        [id, newPartida.jugadorId]);
    return raw;
  }

  updatePartida(Partida newPartida) async {
    final db = await database;
    var res = await db.update("partidas", newPartida.toMap(),
        where: "id = ?", whereArgs: [newPartida.id]);
    return res;
  }

  getPartida(int id) async {
    final db = await database;
    var res = await db.query("partidas", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? Partida.fromMap(res.first) : null;
  }

  Future<List<Partida>> getAllPartidas() async {
    final db = await database;
    var res = await db.query("partidas");
    List<Partida> list = res.isNotEmpty ? res.map((c) => Partida.fromMap(c)).toList() : [];
    return list;
  }

  deletePartidas(int id) async {
    final db = await database;
    return db.delete("partidas", where: "id = ?", whereArgs: [id]);
  }

  deleteAllPartidas() async {
    final db = await database;
    db.rawDelete("Delete * from partidas");
  }

  // Partidas
  newRespuestasPartida(RespuestasPartida newRespuestasPartida) async {
    final db = await database;
    var raw = await db.rawInsert(
        "INSERT Into respuestas_partida (partida_id, respuesta_id, fecha)"
        " VALUES (?,?)",
        [newRespuestasPartida.partidaId, newRespuestasPartida.respuestaId, '0']);
    return raw;
  }

  getRespuestasPartida(int id) async {
    final db = await database;
    var res = await db.query("respuestas_partida", where: "partida_id = ?", whereArgs: [id]);
    return res.isNotEmpty ? RespuestasPartida.fromMap(res.first) : null;
  }

  Future<List<RespuestasPartida>> getAllRespuestasPartidas() async {
    final db = await database;
    var res = await db.query("respuestas_partida");
    List<RespuestasPartida> list = res.isNotEmpty ? res.map((c) => RespuestasPartida.fromMap(c)).toList() : [];
    return list;
  }

  deleteRespuestasPartida(int id) async {
    final db = await database;
    return db.delete("respuestas_partida", where: "partida_id = ?", whereArgs: [id]);
  }

  deleteAllRespuestasPartidas() async {
    final db = await database;
    db.rawDelete("Delete * from respuestas_partida");
  }

  // // ESTADOS PERFIL
  // newEstadosPerfil(EstadosPerfil newEstadosPerfil) async {
  //   final db = await database;
  //   //get the biggest id in the table
  //   // var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM EstadosPerfil");
  //   // int id = table.first["id"];
  //   //insert to the table using the new id
  //   var raw = await db.rawInsert(
  //       "INSERT Into EstadosPerfil (estado_id, perfil_id, activo)"
  //       " VALUES (?,?,?)",
  //       [newEstadosPerfil.estadoId, newEstadosPerfil.perfilId, newEstadosPerfil.activo]);
  //   return raw;
  // }

  // activeOrDeactive(EstadosPerfil estado) async {
  //   final db = await database;

  //   EstadosPerfil activo = EstadosPerfil(
  //       estadoId: estado.estadoId,
  //       perfilId: estado.perfilId,        
  //       activo: !estado.activo
  //   );

  //   var res = await db.update("EstadosPerfil", activo.toMap(),
  //     where: "perfil_id = ? AND estado_id = ?", whereArgs: [estado.perfilId, estado.estadoId]
  //   );
  //   return res;
  // }

  // updateEstadosPerfil(EstadosPerfil newEstadosPerfil) async {
  //   final db = await database;
  //   var res = await db.update("EstadosPerfil", newEstadosPerfil.toMap(),
  //     where: "perfil_id = ? AND estado_id = ?", whereArgs: [newEstadosPerfil.perfilId, newEstadosPerfil.estadoId]    
  //   );
  //   return res;
  // }

  // getEstadosPerfil(int perfilId, int estadoId) async {
  //   final db = await database;
  //   var res = await db.query("EstadosPerfil", where: "perfil_id = ? AND estado_id = ?", whereArgs: [perfilId, estadoId]);
  //   return res.isNotEmpty ? EstadosPerfil.fromMap(res.first) : null;
  // }

  // Future<List<EstadosPerfil>> getBlockedEstadosPerfils() async {
  //   final db = await database;

  //   print("works");
  //   // var res = await db.rawQuery("SELECT * FROM EstadosPerfil WHERE estado=1");
  //   var res = await db.query("EstadosPerfil", where: "activo = ? ", whereArgs: [1]);

  //   List<EstadosPerfil> list = res.isNotEmpty ? res.map((c) => EstadosPerfil.fromMap(c)).toList() : [];
  //   return list;
  // }

  // Future<List<EstadosPerfil>> getAllEstadosPerfils() async {
  //   final db = await database;
  //   var res = await db.query("EstadosPerfil");
  //   List<EstadosPerfil> list = res.isNotEmpty ? res.map((c) => EstadosPerfil.fromMap(c)).toList() : [];
  //   return list;
  // }

  // Future<List<Estado>> getTemporalPivot() async {
  //   final db = await database;
  //   var res = await db.query("Estado");
  //   List<Estado> list = res.isNotEmpty ? res.map((c) => Estado.fromMap(c)).toList() : [];
  //   return list;
  // }

  // deleteEstadosPerfil(int perfilId, int estadoId) async {
  //   final db = await database;
  //   return db.delete("EstadosPerfil", where: "perfil_id = ? AND estado_id = ?", whereArgs: [perfilId, estadoId]);
  // }

  // deleteAllEstadosPerfil() async {
  //   final db = await database;
  //   db.rawDelete("Delete * from EstadosPerfil");
  // }
}