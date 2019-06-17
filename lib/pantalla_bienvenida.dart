import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'registro.dart';

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
                    Spacer(flex: 10),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new Container(
                          width: queryData.size.width - 100,
                          child: new Text("PON A PRUEBA TU CONOCIMIENTO Y SELECCIONA LAS RESPUESTAS CORRECTAS",
                             textAlign: TextAlign.center,
                             style: new TextStyle(
                               color: Colors.blue,
                               fontSize: 28,
                               fontWeight: FontWeight.w900
                            ),
                          )                        
                        )
                       ],
                    ),                    
                    Spacer(flex: 10),
                    new RaisedButton(
                      key: null,
                      color: Colors.blue,
                      textColor: Colors.white,
                      onPressed: buttonPressed,
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)
                      ),
                      child: Text('Siguiente',
                        style: new TextStyle(
                          fontSize: 18
                        ),
                      ),
                    )
                  ]),
            ))));
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

    Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => PageRegistro()),
      // MaterialPageRoute(builder: (context) => Pantalla()),
    );
  }
}
