import 'package:flutter/material.dart';
import 'package:wanapo_game/models/RespuestaModel.dart';

class BotonRespuesta extends StatelessWidget {
  // a property on this class
  final Respuesta respuesta;
  final void Function( Respuesta respuesta) callback;
  // a constructor for this class
  BotonRespuesta(this.callback, this.respuesta);

  Widget build(context) {
    // Pass the text down to another widget
    return new RaisedButton(
        key: null,
        onPressed: () => callback(respuesta),
        splashColor: Colors.green,
        textColor: Colors.white,
        padding: EdgeInsets.only(right: 20, left: 20, bottom: 15, top: 15),
        shape: BeveledRectangleBorder(
            side: BorderSide(
              color: Colors.grey, //Color of the border
              style: BorderStyle.solid, //Style of the border
              width: 3, //width of the border
            ),
            borderRadius: BorderRadius.all(Radius.circular(25.0))),
        color: Colors.blue,
        child: new Text(
          respuesta.texto,
          style: new TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w300,
              fontFamily: "Roboto"),
        ));
  }
}
