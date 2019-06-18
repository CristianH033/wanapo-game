import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'components/boton_respuesta.dart';
import 'components/label_pregunta.dart';
import 'components/line_painter.dart';

class Pantalla extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Generated App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF2196f3),
        accentColor: const Color(0xFF2196f3),
        canvasColor: const Color(0xFFfafafa),
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return new WillPopScope(
      key: null,
      onWillPop: () {
        return Future.value(_allow()); // if true allow back else block it
      },
      child: new Scaffold(
        body: new Container(
          decoration: BoxDecoration(
            // color: Colors.blue,
            image: DecorationImage(
              image: AssetImage("assets/bg/EsquinaSup.png"),
              fit: BoxFit.none,
              alignment: new Alignment(-1.0, -1.0),
            ),
            gradient: RadialGradient(
              focalRadius: 0.5,
              radius: 1.6,
              colors: [
                Colors.white,
                Colors.white,
                Colors.grey,
              ],
            ),
          ),
          child: new Container(
            decoration: BoxDecoration(
               image: DecorationImage(
                image: AssetImage("assets/bg/EsquinaInf.png"),
                fit: BoxFit.none,
                alignment: new Alignment(1.0, 1.0),
              )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Container(
                  height: queryData.size.height / 5,
                  child: new Center(
                    child: new Image(
                      image: AssetImage("assets/bg/Logo.png"),
                      width: 200,
                    )
                  ),
                ),
                CustomPaint(
                  painter: LinePainter(),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new LabelPregunta("Pregunta 1")
                    ],
                  )
                ),
                CustomPaint(
                  painter: LinePainter(),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new BotonRespuesta("Prueba 1", buttonPressed),
                      new BotonRespuesta("Prueba 2", buttonPressed),
                    ],
                  )
                ),
                CustomPaint(
                  painter: LinePainter(),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new BotonRespuesta("Prueba 1", buttonPressed),
                      new BotonRespuesta("Prueba 2", buttonPressed),
                    ],
                  )
                )
              ]
            ),
          )
        ),
      )
    );
  }

  bool _allow() {
    return false;
  }

  void buttonPressed() {
    Navigator.pushReplacement(
      context,
      PageTransition(
        type: PageTransitionType.size,
        curve: Curves.bounceOut,
        duration: Duration(seconds: 1),
        alignment: Alignment.topCenter,
        child: Pantalla()
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
