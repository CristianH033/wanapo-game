import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wanapo_game/pantalla_correcto.dart';
import 'package:wanapo_game/pantalla_timeout.dart';
import 'package:wanapo_game/pantalla_wrong.dart';
import 'package:wanapo_game/sounds/player.dart';
import 'components/LogoSVG.dart';
import 'components/boton_respuesta.dart';
import 'components/label_pregunta.dart';
import 'components/line_painter.dart';
import 'database/Database.dart';
import 'models/PreguntaModel.dart';
import 'models/RespuestaModel.dart';
import 'pantalla_premio.dart';
import 'package:countdown/countdown.dart';
import 'package:flutter/material.dart';


class PantallaPregunta extends StatefulWidget {
  final partida, logRespuestas, preguntas, index;
  PantallaPregunta({Key key, @required this.partida, @required this.logRespuestas, @required this.preguntas, @required this.index}) : super(key: key);
  @override
  _PantallaPreguntaState createState() => new _PantallaPreguntaState();
}

class _PantallaPreguntaState extends State<PantallaPregunta> {
  var partida, logRespuestas, preguntas, index, tiempo = 32, tiempoRestante = 32, w;
  // CountDown cd = CountDown(Duration(seconds : 30));
  var sub;
  @override
  void initState() {
      super.initState();
      Player.stop();
      Player.playLetsPlay();
      Player.playMain();
      CountDown cd = CountDown(Duration(seconds : tiempo));
      sub = cd.stream.listen(null);
      sub.onData((Duration d) {
          this.setState(() {
            tiempoRestante = d.inSeconds.toInt();
          });
          print(d.inSeconds);
      });

      sub.onDone(() {
        // print("done");
        sub.cancel();
        Player.stop();
        Navigator.pushReplacement(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            curve: Curves.bounceOut,
            duration: Duration(seconds: 1),
            alignment: Alignment.topCenter,
            child: PantallaTimeOut(partida: partida, logRespuestas: logRespuestas, preguntas: preguntas, index: index)
          ),
        );
      });
  }
  @override
  Widget build(BuildContext context) {
    partida = widget.partida;
    logRespuestas = widget.logRespuestas;
    preguntas = widget.preguntas;
    index = widget.index;
    MediaQueryData queryData = MediaQuery.of(context);
    w = (queryData.size.width * ((tiempoRestante*100)/32))/100;
    return new WillPopScope(
      key: null,
      onWillPop: () {
        return Future.value(_allow()); // if true allow back else block it
      },
      child: new Scaffold(
        body: FutureBuilder<List<Respuesta>>(
        future: DBProvider.db.getAllRespuestasPregunta(preguntas[index].id),
        builder: (BuildContext context, AsyncSnapshot<List<Respuesta>> respuestas) {
          if (respuestas.hasData) {
            return new Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Spacer(flex: 1),
                new Container(
//                  height: queryData.size.height / 5,
                  child: new Center(
                    child: new LogoSVG(width: queryData.size.width/1.6,height: null)
                    // child: new Image(
                    //   image:  new LogoSVG(),
                    //   width: queryData.size.width/1.6,
                    // )
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
                      new LabelPregunta(preguntas[index].texto)
                    ],
                  )
                ),
                Spacer(flex: 1),
                CustomPaint(
                  painter: LinePainter(),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new BotonRespuesta(buttonPressed, respuestas.data[0]),
                      new BotonRespuesta(buttonPressed, respuestas.data[1]),
                    ],
                  )
                ),
                Spacer(flex: 1),
                CustomPaint(
                  painter: LinePainter(),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new BotonRespuesta(buttonPressed, respuestas.data[2]),
                      new BotonRespuesta(buttonPressed, respuestas.data[3]),
                    ],
                  )
                ),
                Spacer(flex: 1),
//                CustomPaint(
//                    painter: LinePainter(),
//                    child: new Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceAround,
//                      mainAxisSize: MainAxisSize.max,
//                      crossAxisAlignment: CrossAxisAlignment.center,
//                      children: <Widget>[
//                        new BotonRespuesta(buttonPressed, respuestas.data[2]),
////                        new BotonRespuesta(buttonPressed, respuestas.data[3]),
//                      ],
//                    )
//                ),
//                Spacer(flex: 1),
//                CustomPaint(
//                    painter: LinePainter(),
//                    child: new Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceAround,
//                      mainAxisSize: MainAxisSize.max,
//                      crossAxisAlignment: CrossAxisAlignment.center,
//                      children: <Widget>[
////                        new BotonRespuesta(buttonPressed, respuestas.data[2]),
//                        new BotonRespuesta(buttonPressed, respuestas.data[3]),
//                      ],
//                    )
//                ),
//                Spacer(flex: 1),
//                new Material(
//                  shape: const BeveledRectangleBorder(
//                    borderRadius: BorderRadius.all(Radius.circular(50)),
//                    side: BorderSide(color: Colors.blue, width: 3),
//                  ),
//                  child: new Container(
//                      padding: EdgeInsets.only(right: 20, left: 20, bottom: 20, top: 20),
//                      child: new Text('$tiempoRestante', style: new TextStyle(fontSize: 20, fontWeight: FontWeight.w500),)
//                  )
//                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Container(
                      height: 10,
                      width: w,
                      alignment: Alignment(-10, -10),
                      decoration: BoxDecoration(
                          borderRadius: new BorderRadius.all(new Radius.circular(10)),
                          boxShadow: [
                            new BoxShadow(
                              color: tiempoRestante < 10 ? Colors.red : Colors.green,
                              offset: new Offset(0.0, 0.0),
                              blurRadius: 2.0,
                            )
                          ],
                          color: tiempoRestante < 10 ? Colors.red : Colors.green
                      ),
                    ),
                    new Text('$tiempoRestante',
                      style: new TextStyle(
                          color: tiempoRestante < 10 ? Colors.red : Colors.green,
                          fontSize: 20,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ],
                ),
              ]
            );
          }else{
            return new Container(
              child: Center(child: CircularProgressIndicator()),
            );
          }
         }
        ),
      )
    );
  }

  bool _allow() {
    return false;
  }

  void buttonPressed(Respuesta respuesta ) {
    // Navigator.pushReplacement(
    //   context,
    //   PageTransition(
    //     type: PageTransitionType.size,
    //     curve: Curves.bounceOut,
    //     duration: Duration(seconds: 1),
    //     alignment: Alignment.topCenter,
    //     child: PantallaPremio()
    //   ),
    // );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        Player.playFinal();
        return new CupertinoAlertDialog(
          title: new Text("Final Word?"),
          content: new Text(""),
          actions: <Widget>[
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () {
                sub.cancel();
                Player.stop();
                Navigator.of(context).pop();
                logRespuestas.add(respuesta.id);
                // print(logRespuestas);
                // print("index: $index");
                if(respuesta.correcta){
                  // print("Id de partida en pregunta: $partida");
                  Navigator.pushReplacement(
                    context,
                    PageTransition(
                      type: PageTransitionType.fade,
                      curve: Curves.bounceOut,
                      duration: Duration(seconds: 1),
                      alignment: Alignment.topCenter,
                      child: new PantallaCorrecto(partida: partida, logRespuestas: logRespuestas, preguntas: preguntas, index: index)
                    ),
                  );
                }else{
                  Navigator.pushReplacement(
                    context,
                    PageTransition(
                      type: PageTransitionType.fade,
                      curve: Curves.bounceOut,
                      duration: Duration(seconds: 1),
                      alignment: Alignment.topCenter,
                      child: PantallaWrong(partida: partida, logRespuestas: logRespuestas, preguntas: preguntas, index: index)
                    ),
                  );
                }
              },
              child: Text("Yes"),
            ),
            CupertinoDialogAction(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("No"),
            )
          ],
        );
      },
    );
  }
}
