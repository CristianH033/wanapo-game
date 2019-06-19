import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wanapo_game/pantalla_bienvenida.dart';
import 'package:wanapo_game/sounds/player.dart';
import 'components/label_premio.dart';
import 'components/line_painter.dart';

class PantallaResultados extends StatefulWidget {
  final partida, logRespuestas, preguntas, index;
  PantallaResultados({Key key, @required this.partida, @required this.logRespuestas, @required this.preguntas, @required this.index}) : super(key: key);
  @override
  _PantallaResultadosState createState() => new _PantallaResultadosState();
}

class _PantallaResultadosState extends State<PantallaResultados> {
  var partida, logRespuestas, preguntas, index;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Player.stop();
    Player.playIntro();
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
                  child: Text('Inicio',
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
    Player.stop();
    Navigator.pushReplacement(
      context,
      PageTransition(
        type: PageTransitionType.fade,
        curve: Curves.bounceOut,
        duration: Duration(seconds: 1),
        alignment: Alignment.topCenter,
        child: new PageBienvenida()
      ),
    );
  }
}
