import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;

void main() {
  // See https://github.com/flutter/flutter/wiki/Desktop-shells#target-platform-override
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;

  runApp(new MyApp());
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
        // Box decoration takes a gradient
        gradient: RadialGradient(
          // Where the linear gradient begins and ends
          // begin: Alignment.topRight,
          // end: Alignment.bottomLeft,
          // Add one stop for each color. Stops should increase from 0 to 1
          // stops: [0.1, 0.3, 0],
          focalRadius: 0.5,
          radius: 1.6,
          colors: [
            // Colors are easy thanks to Flutter's Colors class.
            Colors.white,
            Colors.white,
            Colors.grey,
          ],
        ),
      ),
        child: 
      new Column(
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
      )
    );
  }

  void buttonPressed() {}
}
