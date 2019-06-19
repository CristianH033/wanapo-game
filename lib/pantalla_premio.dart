import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wanapo_game/pantalla_pregunta.dart';
import 'package:wanapo_game/pantalla_resultados.dart';
import 'components/label_premio.dart';
import 'components/line_painter.dart';

class PantallaPremio extends StatefulWidget {
  final data, pregunta, index;
  PantallaPremio({Key key, @required this.data, @required this.pregunta, @required this.index}) : super(key: key);
  @override
  _PantallaPremioState createState() => new _PantallaPremioState();
}

class _PantallaPremioState extends State<PantallaPremio> {
  var data, pregunta, index;
  @override
  Widget build(BuildContext context) {
    data = widget.data;
    pregunta = widget.pregunta;
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
                      new LabelPremio("GANASTE UN PREMIO X")
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
    if((index + 1) < data.length){
      Page = new PantallaPregunta(data: data, pregunta: data[index+1], index: index+1);
    }else{
      Page = new PantallaResultados(data: data, pregunta: data[index], index: index);
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
