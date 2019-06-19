import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;
import 'package:wanapo_game/pantalla_pregunta.dart';
import 'pantalla_bienvenida.dart';

void main() {
  // See https://github.com/flutter/flutter/wiki/Desktop-shells#target-platform-override
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;

  runApp(new PageBienvenida());
}

class MyApp extends StatelessWidget {
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
    var respuestas = ["one", "two", "three", "four"];
    var botones = <RaisedButton>[];
    for (var i = 0; i < respuestas.length; i++) {
      botones.add(
        new RaisedButton(
            key: null,
            onPressed: buttonPressed,
            shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            color: const Color(0xFFe0e0e0),
            child: new Text(
              respuestas[i],
              style: new TextStyle(
                  fontSize: 12.0,
                  color: const Color(0xFF000000),
                  fontWeight: FontWeight.w200,
                  fontFamily: "Roboto"),
            )),
      );
    }
    return new Scaffold(
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
                  // color: Colors.blue,
                  image: DecorationImage(
                image: AssetImage("assets/bg/EsquinaInf.png"),
                fit: BoxFit.none,
                alignment: new Alignment(1.0, 1.0),
              )),
              child: new Container(
              decoration: BoxDecoration(
                  // color: Colors.blue,
                  image: DecorationImage(
                    image: AssetImage("assets/bg/LogoSmall.png"),
                    fit: BoxFit.none,
                    alignment: new Alignment(1.0, -1.0),
              )),
              child: new Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Text(
                            "qWerty1",
                            style: new TextStyle(
                                fontSize: 37.0,
                                color: const Color(0xFF000000),
                                fontWeight: FontWeight.w200,
                                fontFamily: "Roboto"),
                          )
                        ]),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: botones,
                    )
                  ]),
            ))));
  }

  void buttonPressed() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => PantallaPregunta()),
    );

    // Navigator.push(
    // context,
    // MaterialPageRoute(builder: (context) => Pantalla()),
    // );
  }
}
