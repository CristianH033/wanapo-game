import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;
import 'pantalla.dart';

void main() {
  // See https://github.com/flutter/flutter/wiki/Desktop-shells#target-platform-override
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;

  runApp(new PageBienvenida());
}

class PageBienvenida extends StatelessWidget {
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
              padding: const EdgeInsets.all(20.0),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Text("PON A PRUEBA TU CONOCIMIENTO Y SELECCIONA LAS RESPUESTAS CORRECTAS",
                      style: new TextStyle(
                        color: Colors.blue,
                        fontSize: 28,
                        fontWeight: FontWeight.w900
                      ),
                    ),
                    new RaisedButton(
                      key: null,
                      onPressed: buttonPressed,
                      child: Text('text'),
                    )
                  ]),
            ))));
  }

  void buttonPressed() {
    Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => Pantalla()),
      // MaterialPageRoute(builder: (context) => Pantalla()),
    );

    // Navigator.push(
    // context,
    // MaterialPageRoute(builder: (context) => Pantalla()),
    // );
  }
}
