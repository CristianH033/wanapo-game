import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wanapo_game/pantalla_pregunta.dart';
import 'components/label_premio.dart';
import 'components/line_painter.dart';

class PantallaResultados extends StatefulWidget {
  final data, pregunta, index;
  PantallaResultados({Key key, @required this.data, @required this.pregunta, @required this.index}) : super(key: key);
  @override
  _PantallaResultadosState createState() => new _PantallaResultadosState();
}

class _PantallaResultadosState extends State<PantallaResultados> {
  var data, pregunta, index;
  @override
  Widget build(BuildContext context) {
    data = widget.data;
    pregunta = widget.pregunta;
    index = widget.index;
    MediaQueryData queryData = MediaQuery.of(context);
    return new WillPopScope(
      key: null,
      onWillPop: () {
        return Future.value(_allow()); // if true allow back else block it
      },
      child: new Scaffold(
        body: new Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Container(
                  height: queryData.size.height / 5,
                  child: new Center(
                    child: new Image(
                      image: AssetImage("assets/images/Logo.png"),
                      width: 200,
                    )
                  ),
                ),
                Spacer(flex: 1),
                CustomPaint(
                  painter: LinePainter(),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new LabelPremio("Resultados:")
                    ],
                  )
                ),
                Spacer(flex: 1),
                new RaisedButton(
                  key: null,
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: buttonPressed,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)
                  ),
                  child: Text('Terminar',
                    style: new TextStyle(
                      fontSize: 18
                    ),
                  ),
                )
              ]
            ),
      )
    );
  }

  bool _allow() {
    return false;
  }

  void buttonPressed() {
    
    // showDialog(
    //   context: context,
    //   builder: (BuildContext context) {
    //     // return object of type Dialog
    //     return new CupertinoAlertDialog(
    //       title: new Text("Dialog Title"),
    //       content: new Text("This is my content"),
    //       actions: <Widget>[
    //         CupertinoDialogAction(
    //           isDefaultAction: true,
    //           onPressed: () {
    //             Navigator.of(context).pop();
    //           },
    //           child: Text("Yes"),
    //         ),
    //         CupertinoDialogAction(
    //           onPressed: () {
    //             Navigator.of(context).pop();
    //           },
    //           child: Text("No"),
    //         )
    //       ],
    //     );
    //   },
    // );
  }
}
