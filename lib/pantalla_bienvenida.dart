import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'registro.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';

class PageBienvenida extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Wanapo Game',
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
  AudioPlayer mainIntro = AudioPlayer();
  // AudioPlayer mainGame = AudioPlayer();
  // AudioPlayer wrong = AudioPlayer();
  // AudioPlayer correct = AudioPlayer();
  // AudioPlayer breaks = AudioPlayer();
  // AudioPlayer letsPlay = AudioPlayer();
  
  AudioCache mainIntroCache = AudioCache(prefix: 'sonidos/');
  // AudioCache mainGameCache = AudioCache(prefix: 'sonidos/');
  // AudioCache wrongCache = AudioCache(prefix: 'sonidos/');
  // AudioCache correctCache = AudioCache(prefix: 'sonidos/');
  // AudioCache breaksCache = AudioCache(prefix: 'sonidos/');
  // AudioCache letsPlayCache = AudioCache(prefix: 'sonidos/');

  @override
  initState() {
    super.initState();
    mainIntroCache.loadAll(['break.mp3', 'correct.mp3', 'lets_play.mp3', 'main.mp3', 'main_theme.mp3', 'wrong.mp3',]);
    playAudio();
  }

  @override
  void dispose() { 
    super.dispose();    
    // player.clearAll();
  }


  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return new Scaffold(
        body: new Container(
            decoration: BoxDecoration(
              // color: Colors.blue,
              image: DecorationImage(
                image: AssetImage("assets/images/EsquinaSup.png"),
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
                image: AssetImage("assets/images/EsquinaInf.png"),
                fit: BoxFit.none,
                alignment: new Alignment(1.0, 1.0),
              )),
              child: new Container(
                decoration: BoxDecoration(
                  // color: Colors.blue,
                  image: DecorationImage(
                    image: AssetImage("assets/images/LogoSmall.png"),
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

  Future playAudio() async {
    mainIntro = await mainIntroCache.loop('main_theme.mp3', isNotification: false);
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
    mainIntro.stop();
    Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => new PageRegistro()),
      // MaterialPageRoute(builder: (context) => Pantalla()),
    );
  }
}
