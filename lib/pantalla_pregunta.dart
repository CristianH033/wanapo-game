import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wanapo_game/pantalla_timeout.dart';
import 'package:wanapo_game/pantalla_wrong.dart';
import 'components/boton_respuesta.dart';
import 'components/label_pregunta.dart';
import 'components/line_painter.dart';
import 'pantalla_premio.dart';
import 'package:countdown/countdown.dart';

class PantallaPregunta extends StatefulWidget {
  final data, pregunta, index;
  PantallaPregunta({Key key, @required this.data, @required this.pregunta, @required this.index}) : super(key: key);
  @override
  _PantallaPreguntaState createState() => new _PantallaPreguntaState();
}

class _PantallaPreguntaState extends State<PantallaPregunta> {
  var data, pregunta, index, tiempo = 35, tiempoRestante = 35, w;
  // CountDown cd = CountDown(Duration(seconds : 30));
  var sub;
  @override
  void initState() {
      super.initState();
      CountDown cd = CountDown(Duration(seconds : tiempo));
      sub = cd.stream.listen(null);
      sub.onData((Duration d) {
          this.setState(() {
            tiempoRestante = d.inSeconds.toInt();
          });
          print(d.inSeconds);
      });

      sub.onDone(() {
        print("done");
        sub.cancel();
        Navigator.pushReplacement(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            curve: Curves.bounceOut,
            duration: Duration(seconds: 1),
            alignment: Alignment.topCenter,
            child: PantallaTimeOut(data: data, pregunta: data[index], index: index)
          ),
        );
      });
  }
  @override
  Widget build(BuildContext context) {
    data = widget.data;
    pregunta = widget.pregunta;
    index = widget.index;
    MediaQueryData queryData = MediaQuery.of(context);
    w = (queryData.size.width * ((tiempoRestante*100)/30))/100;
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
                Spacer(flex: 1),
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
                      new LabelPregunta(pregunta["texto"])
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
                      new BotonRespuesta(pregunta["respuestas"][0]["texto"], buttonPressed, pregunta["respuestas"][0]["correcta"]),
                      new BotonRespuesta(pregunta["respuestas"][1]["texto"], buttonPressed, pregunta["respuestas"][1]["correcta"]),
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
                      new BotonRespuesta(pregunta["respuestas"][2]["texto"], buttonPressed, pregunta["respuestas"][2]["correcta"]),
                      new BotonRespuesta(pregunta["respuestas"][3]["texto"], buttonPressed, pregunta["respuestas"][3]["correcta"]),
                    ],
                  )
                ),
                Spacer(flex: 1),
                new Material(
                  shape: const BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    side: BorderSide(color: Colors.blue, width: 3),
                  ),
                  child: new Container(
                    padding: EdgeInsets.only(right: 20, left: 20, bottom: 20, top: 20),
                    child: new Text('$tiempoRestante', style: new TextStyle(fontSize: 20, fontWeight: FontWeight.w500),)
                  )
                ),
                new Container(
                  height: 10,
                  width: w,
                  decoration: BoxDecoration(
                    borderRadius: new BorderRadius.all(new Radius.circular(10)),
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.red,
                        offset: new Offset(0.0, 0.0),
                        blurRadius: 2.0,
                      )
                    ],
                    color: Colors.red
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

  void buttonPressed(bool correcta ) {
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
        return new CupertinoAlertDialog(
          title: new Text("Última Palabra?"),
          content: new Text(""),
          actions: <Widget>[
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () {
                sub.cancel();
                Navigator.of(context).pop();
                if(correcta){
                  Navigator.pushReplacement(
                    context,
                    PageTransition(
                      type: PageTransitionType.fade,
                      curve: Curves.bounceOut,
                      duration: Duration(seconds: 1),
                      alignment: Alignment.topCenter,
                      child: PantallaPremio(data: data, pregunta: data[index], index: index)
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
                      child: PantallaWrong(data: data, pregunta: data[index], index: index)
                    ),
                  );
                }
              },
              child: Text("Si"),
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
