import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wanapo_game/pantalla_pregunta.dart';

class PageRegistro extends StatelessWidget {
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
  TextEditingController nameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/images/Logo.png'),
      ),
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      initialValue: 'Campo',
      decoration: InputDecoration(
        hintText: 'Nombre',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final campox = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      initialValue: 'Campo',
      decoration: InputDecoration(
        hintText: 'Nombre',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final campoy = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      initialValue: 'Campo',
      decoration: InputDecoration(
        hintText: 'Nombre',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      initialValue: 'Campo',
      obscureText: false,
      decoration: InputDecoration(
        hintText: 'Apellidos',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          buttonPressed();
          // Navigator.of(context).pushReplacement(new Pantalla());
        },
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        child: Text('JUGAR', style: TextStyle(color: Colors.white)),
      ),
    );

    return Scaffold(
      // backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 48.0),
            email,
            SizedBox(height: 8.0),
            password,
            SizedBox(height: 8.0),
            campox,
            SizedBox(height: 8.0),
            campoy,
            SizedBox(height: 24.0),
            loginButton,
          ],
        ),
      ),
    );
  }

  void submitPup(BuildContext context) {
    if (nameController.text.isEmpty) {
      // print('Dogs need names!');
    } else {
      // Navigator.of(context).pop(newDog);
    }
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

    var data = [
      { "pregunta": 1, "texto": "Pregunta 1", "respuestas": [
          { "respuesta": 1, "texto": "respuesta 1", "correcta": true },
          { "respuesta": 2, "texto": "respuesta 2", "correcta": false },
          { "respuesta": 3, "texto": "respuesta 3", "correcta": false },
          { "respuesta": 4, "texto": "respuesta 4", "correcta": false },
        ]
      },
      { "pregunta": 2, "texto": "Pregunta 2", "respuestas": [
          { "respuesta": 1, "texto": "respuesta 2", "correcta": false },
          { "respuesta": 2, "texto": "respuesta 1", "correcta": true },
          { "respuesta": 3, "texto": "respuesta 3", "correcta": false },
          { "respuesta": 4, "texto": "respuesta 4", "correcta": false },
        ]
      },
      { "pregunta": 3, "texto": "Pregunta 3", "respuestas": [
          { "respuesta": 1, "texto": "respuesta 2", "correcta": false },
          { "respuesta": 2, "texto": "respuesta 3", "correcta": false },
          { "respuesta": 1, "texto": "respuesta 1", "correcta": true },
          { "respuesta": 4, "texto": "respuesta 4", "correcta": false },
        ]
      },
      { "pregunta": 4, "texto": "Pregunta 4", "respuestas": [
          { "respuesta": 1, "texto": "respuesta 2", "correcta": false },
          { "respuesta": 3, "texto": "respuesta 1", "correcta": true },
          { "respuesta": 2, "texto": "respuesta 3", "correcta": false },
          { "respuesta": 4, "texto": "respuesta 4", "correcta": false },
        ]
      },
      { "pregunta": 5, "texto": "Pregunta 5", "respuestas": [
          { "respuesta": 1, "texto": "respuesta 2", "correcta": false },
          { "respuesta": 2, "texto": "respuesta 3", "correcta": false },
          { "respuesta": 4, "texto": "respuesta 4", "correcta": false },
          { "respuesta": 1, "texto": "respuesta 1", "correcta": true },
        ]
      },
      { "pregunta": 6, "texto": "Pregunta 6", "respuestas": [
          { "respuesta": 3, "texto": "respuesta 1", "correcta": true },
          { "respuesta": 1, "texto": "respuesta 2", "correcta": false },
          { "respuesta": 2, "texto": "respuesta 3", "correcta": false },
          { "respuesta": 4, "texto": "respuesta 4", "correcta": false },
        ]
      },
      { "pregunta": 7, "texto": "Pregunta 7", "respuestas": [
          { "respuesta": 1, "texto": "respuesta 2", "correcta": false },
          { "respuesta": 2, "texto": "respuesta 3", "correcta": false },
          { "respuesta": 3, "texto": "respuesta 1", "correcta": true },
          { "respuesta": 4, "texto": "respuesta 4", "correcta": false },
        ]
      },
      { "pregunta": 8, "texto": "Pregunta 8", "respuestas": [
          { "respuesta": 3, "texto": "respuesta 2", "correcta": false },
          { "respuesta": 2, "texto": "respuesta 3", "correcta": false },
          { "respuesta": 1, "texto": "respuesta 1", "correcta": true },
          { "respuesta": 4, "texto": "respuesta 4", "correcta": false },
        ]
      }
    ];

    Navigator.pushReplacement(
      context,
      PageTransition(
        type: PageTransitionType.size,
        curve: Curves.bounceOut,
        duration: Duration(seconds: 1),
        alignment: Alignment.topCenter,
        child: PantallaPregunta(data: data, pregunta: data[0], index: 0)
      ),
    );
    
    // Navigator.pushReplacement(
      // context,
      // CupertinoPageRoute(builder: (context) => Pantalla()),
      // MaterialPageRoute(builder: (context) => Pantalla()),
    // );
  }
}
