import 'package:flutter/material.dart';

class BotonRespuesta extends StatelessWidget {
  // a property on this class
  final String text;
  final void Function() callback;
  // a constructor for this class
  BotonRespuesta(this.text, this.callback);

  Widget build(context) {
    // Pass the text down to another widget
    return new RaisedButton(
        key: null,
        onPressed: callback,
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
          text,
          style: new TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w300,
              fontFamily: "Roboto"),
        ));
  }
}
