import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wanapo_game/components/label_wrong.dart';
import 'package:wanapo_game/pantalla_pregunta.dart';
import 'package:wanapo_game/pantalla_resultados.dart';
import 'package:wanapo_game/sounds/player.dart';
import 'components/line_painter.dart';

class PantallaWrong extends StatefulWidget {
  final partida, logRespuestas, preguntas, index;
  PantallaWrong({Key key, @required this.partida, @required this.logRespuestas, @required this.preguntas, @required this.index}) : super(key: key);  
  @override
  _PantallaWrongState createState() => new _PantallaWrongState();
}

class _PantallaWrongState extends State<PantallaWrong> {
  var partida, logRespuestas, preguntas, index;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Player.stop();
    Player.playWrong();
  }
  @override
  Widget build(BuildContext context) {
    partida = widget.partida;
    logRespuestas = widget.logRespuestas;
    preguntas = widget.preguntas;
    index = widget.index;
    MediaQueryData queryData = MediaQuery.of(context);
    return new WillPopScope(
      key: null,
      onWillPop: () {
        return Future.value(_allow()); // if true allow back else block it
      },
      child: new Scaffold(
        body: new Container(
            decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
              fit: BoxFit.cover,
              // alignment: new Alignment(1.0, 1.0),
              repeat: ImageRepeat.repeat,
              image: AssetImage("assets/gif/electric4.gif")),
            ),
            child: new Column(
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
                      new LabelWorong("RESPUESTA EQUIVOCADA")
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
                  child: Text('Continuar',
                    style: new TextStyle(
                      fontSize: 18
                    ),
                  ),
                )
              ]
            ),
         )
      )
    );
  }

  bool _allow() {
    return false;
  }

  void buttonPressed() {
    var Page;    
    if((index + 1) < preguntas.length){
      Page = new PantallaPregunta(partida: partida, logRespuestas: logRespuestas, preguntas: preguntas, index: index+1);
    }else{
      Page = new PantallaResultados(partidaActual: partida, logRespuestas: logRespuestas);
    }
    Navigator.pushReplacement(
      context,
      PageTransition(
        type: PageTransitionType.size,
        curve: Curves.bounceOut,
        duration: Duration(seconds: 1),
        alignment: Alignment.topCenter,
        child: Page
      ),
    );
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
