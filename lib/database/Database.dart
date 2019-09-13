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
import 'package:intl/intl.dart';
import 'dart:io' as io;

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  Database _database;

  Future<Database> get database async {
    // await deleteDB();
    if (_database != null) return _database;
    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  deleteDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "wanapo.db");
    bool existe = await io.File(path).exists();
    // print(existe);
    if( existe ){
      await io.File(path).delete();
    }
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "wanapo.db");
    // print(path);
    return await openDatabase(
      path, 
      version: 1, 
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute(
           "CREATE TABLE 'jugadores'"
            "("
            " 'id'         INTEGER PRIMARY KEY,"
            " 'nombres'    varchar(255) NOT NULL ,"
            " 'apellidos'  varchar(255) NOT NULL ,"
            " 'correo'  varchar(255) NOT NULL ,"
            " 'celular'  varchar(255) NOT NULL ,"
            " 'fecha_creacion'   varchar(255) NOT NULL"
            ")"
        );

        await db.execute(
            "CREATE TABLE 'partidas'"
            "("
            " 'id'         INTEGER PRIMARY KEY,"
            " 'jugador_id' integer NOT NULL ,"
            " 'fecha_creacion'   varchar(255) NOT NULL,"
            " FOREIGN KEY ('jugador_id') REFERENCES 'jugadores' ('id')"
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
            " 'fecha'        varchar(255) NOT NULL ,"
            " FOREIGN KEY ('partida_id') REFERENCES 'partidas' ('id'),"
            " FOREIGN KEY ('respuesta_id') REFERENCES 'respuestas' ('id')"
            ")"
        );

        // await db.execute(
        //     "INSERT INTO jugadores"
        //     "(id, nombres, apellidos, correo, fecha_creacion)"
        //     "VALUES(1057015139, 'Cristian', 'Home', 'cristian_david033@hotmail.com', 0)"
        // );

        await db.execute(
            "INSERT INTO preguntas"
            "(id, texto, puntaje)"
            "VALUES (1, 'In which countries the Bogotá Energy Group has a presence?', 1),"
            "(2, 'In which country are we # 1 in the gas and electric energy market?', 1),"
            "(3, 'In which country are we # 1 in the gas transport market?', 1),"
            "(4, 'What is the capacity of TGI in Colombia?', 1),"
            "(5, 'What is the percentage of TGI participation in the national gas market?', 1),"
            "(6, 'What is the length of the TGI infrastructure in Colombia?', 1),"
            "(7, 'Which are the companies that has the bogota energy group in the gas market in peru?', 1),"
            "(8, 'What is the capacity of Cálidda in Peru?', 1),"
            "(9, 'How many districts does Calidda attend in Lima and Callao?', 1),"
            "(10, 'What is the capacity of Contugas in Peru?', 1),"
            "(11, 'What is the length of the Contugas  infrastructure in Peru?', 1)"
        );

        await db.execute(
            "INSERT INTO respuestas"
            "(id, texto, correcta, pregunta_id)"
            "VALUES (1,' Guatemala, Ecuador, Colombia and Venezuela', 0, 1),"
            "(2,' Colombia, Argentina, Chile and Cuba', 0, 1),"
            "(3,' Guatemala, Brasil, Peru and Colombia', 1, 1),"
            "(4,' Usa, México, Colombia and Perú', 0, 1),"
            "(5,' Colombia.', 0, 2),"
            "(6,' Peru', 1, 2),"
            "(7,' Guatemala', 0, 2),"
            "(8,' Brasil', 0, 2),"
            "(9,' Colombia.', 1, 3),"
            "(10, 'Peru', 0, 3),"
            "(11, 'Guatemala', 0, 3),"
            "(12, 'Brasil', 0, 3),"
            "(13, '784 MMFSCD', 1, 4),"
            "(14, '650 MMFSCD', 0, 4),"
            "(15, '532 MMFSCD', 0, 4),"
            "(16, '421 MMFSCD', 0, 4),"
            "(17, '22%', 0, 5),"
            "(18, '35%', 0, 5),"
            "(19, '55%', 1, 5),"
            "(20, '48%', 0, 5),"
            "(21, '1800 KM', 0, 6),"
            "(22, '2700 KM', 0, 6),"
            "(23, '3125 km', 0, 6),"
            "(24, '4000 KM', 1, 6),"
            "(25, 'Cálidda – Contugas', 1, 7),"
            "(26, 'Perugas – Cálidda', 0, 7),"
            "(27, 'Contugas – Limagas', 0, 7),"
            "(28, 'TGP', 0, 7),"
            "(29, '195 MMFSCD', 0, 8),"
            "(30, '334 MMFSCD', 0, 8),"
            "(31, '420 MMFSCD', 1, 8),"
            "(32, '215 MMFSCD', 0, 8),"
            "(33, '18', 0, 9),"
            "(34, '26', 0, 9),"
            "(35, '31', 0, 9),"
            "(36, '42', 1, 9),"
            "(37, '221 MMFSCD', 0, 10),"
            "(38, '301 MMFSCD', 0, 10),"
            "(39, '380 MMFSCD', 1, 10),"
            "(40, '147 MMFSCD', 0, 10),"
            "(41, '1300 KM', 1, 11),"
            "(42, '700 KM', 0, 11),"
            "(43, '3125 km', 0, 11),"
            "(44, '2143 KM', 0, 11)"
        );
      }
    );
  }

  // Jugador
  newJugador(Jugador newJugador) async {
    final db = await database;
    var raw = await db.rawInsert(
        "INSERT Into jugadores (id, nombres, apellidos, correo, celular, fecha_creacion)"
        "VALUES (?,?,?,?,?,?)",
        [newJugador.id, newJugador.nombres, newJugador.apellidos, newJugador.correo, newJugador.celular, fechaNow()]);
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

  Future<List<Respuesta>> getAllRespuestasPregunta(int preguntaId) async {
    final db = await database;
    var res = await db.query("respuestas", where: "pregunta_id = ?", whereArgs: [preguntaId]);
    List<Respuesta> list = res.isNotEmpty ? res.map((c) => Respuesta.fromMap(c)).toList() : [];
    return list;
  }
  
  Future<List<Respuesta>> getAllRespuestas() async {
    final db = await database;
    var res = await db.query("respuestas");
    List<Respuesta> list = res.isNotEmpty ? res.map((c) => Respuesta.fromMap(c)).toList() : [];
    return list;
  }

  // Partidas
  newPartida(Partida newPartida) async {
    final db = await database;
    //get the biggest id in the table
    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM partidas");
    int id = table.first["id"] == null ? 1 : table.first["id"];
    // print("Id de partida en DB: $id");
    //insert to the table using the new id
    var raw = await db.rawInsert(
        "INSERT Into partidas (id, jugador_id, fecha_creacion)"
        " VALUES (?,?,?)",
        [id, newPartida.jugadorId, fechaNow()]);
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
    // print("Por aqui me llaman");
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
        "VALUES (?,?,?)",
        [newRespuestasPartida.partidaId, newRespuestasPartida.respuestaId, fechaNow()]);
    return raw;
  }

  Future<List<RespuestasPartida>> getRespuestasPartida(int id) async {
    // print(id);
    final db = await database;
    var res = await db.query("respuestas_partida", where: "partida_id = ?", whereArgs: [id]);
    // print(res);
    List<RespuestasPartida> list = res.isNotEmpty ? res.map((c) => RespuestasPartida.fromMap(c)).toList() : [];
    // print(list);
    // print(list[0].respuestaId);
    // print(list[0].fecha);
    return list;
  }

  Future<List<RespuestasPartida>> getAllRespuestasPartidas() async {
    final db = await database;
    var res = await db.query("respuestas_partida");
    // print(res);
    List<RespuestasPartida> list = res.isNotEmpty ? res.map((c) => RespuestasPartida.fromMap(c)).toList() : [];
    // print(list);
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

  // print("works");
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


  String fechaNow(){
    var now = new DateTime.now();
    var formatter = new DateFormat("yyyy/MM/dd 'a las' HH:mm:ss");
    String formatted = formatter.format(now);
    // print(formatted);
    return formatted;
  }
}