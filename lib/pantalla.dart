import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                    // color: Colors.blue,
                    image: DecorationImage(
                  image: AssetImage("assets/bg/EsquinaInf.png"),
                  fit: BoxFit.none,
                  alignment: new Alignment(1.0, 1.0),
                )),
                child: new Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            new Image(
                              image: AssetImage("assets/bg/Logo.png"),
                              width: 200,
                            )
                          ]),
                      new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            new Column(children: <Widget>[
                              new Material(
                                shape: const BeveledRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)),
                                  side:
                                      BorderSide(color: Colors.grey, width: 3),
                                ),
                                color: Colors.white,
                                child: new Container(
                                  constraints: BoxConstraints(
                                      maxWidth: queryData.size.width - 100),
                                  margin: const EdgeInsets.only(
                                      left: 40.0,
                                      right: 40.0,
                                      top: 10.0,
                                      bottom: 10.0),
                                  child: new Text(
                                    "Pregunta 1:",
                                    textAlign: TextAlign.justify,
                                    style: new TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Roboto"),
                                  ),
                                ),
                              ),
                            ])
                          ]),
                      new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            new Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  new RaisedButton(
                                      key: null,
                                      splashColor: Colors.green,
                                      textColor: Colors.white,
                                      shape: BeveledRectangleBorder(
                                          side: BorderSide(
                                            color: Colors
                                                .grey, //Color of the border
                                            style: BorderStyle
                                                .solid, //Style of the border
                                            width: 3, //width of the border
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(18.0))),
                                      onPressed: buttonPressed,
                                      color: Colors.blue,
                                      child: new Text(
                                        "Respuesta 1",
                                        style: new TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w300,
                                            fontFamily: "Roboto"),
                                      )),
                                  new RaisedButton(
                                      key: null,
                                      splashColor: Colors.green,
                                      textColor: Colors.white,
                                      shape: BeveledRectangleBorder(
                                          side: BorderSide(
                                            color: Colors
                                                .grey, //Color of the border
                                            style: BorderStyle
                                                .solid, //Style of the border
                                            width: 3, //width of the border
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(18.0))),
                                      onPressed: buttonPressed,
                                      color: Colors.blue,
                                      child: new Text(
                                        "Respuesta 2",
                                        style: new TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w300,
                                            fontFamily: "Roboto"),
                                      ))
                                ]),
                            new Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  new RaisedButton(
                                      key: null,
                                      splashColor: Colors.green,
                                      textColor: Colors.white,
                                      shape: BeveledRectangleBorder(
                                          side: BorderSide(
                                            color: Colors
                                                .grey, //Color of the border
                                            style: BorderStyle
                                                .solid, //Style of the border
                                            width: 3, //width of the border
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(18.0))),
                                      onPressed: buttonPressed,
                                      color: Colors.blue,
                                      child: new Text(
                                        "Respuesta 3",
                                        style: new TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w300,
                                            fontFamily: "Roboto"),
                                      )),
                                  new RaisedButton(
                                      key: null,
                                      splashColor: Colors.green,
                                      textColor: Colors.white,
                                      shape: BeveledRectangleBorder(
                                          side: BorderSide(
                                            color: Colors
                                                .grey, //Color of the border
                                            style: BorderStyle
                                                .solid, //Style of the border
                                            width: 3, //width of the border
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(18.0))),
                                      onPressed: buttonPressed,
                                      color: Colors.blue,
                                      child: new Text(
                                        "Respuesta 4",
                                        style: new TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w300,
                                            fontFamily: "Roboto"),
                                      ))
                                ])
                          ])
                    ]),
                padding: const EdgeInsets.all(0.0),
                alignment: Alignment.center,
              )),
        ));
  }

  bool _allow() {
    return false;
  }

  void buttonPressed() {}
}
