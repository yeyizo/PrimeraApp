import 'package:flutter/material.dart';
import 'dart:async';

import 'dog_model.dart';
import 'dog_list.dart';
import 'new_dog_form.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'We Rate Pulpos Reversibles',
      theme: ThemeData(brightness: Brightness.dark),
      home: MyHomePage(
        title: 'We Hate Pulpos Reversibles',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Dog> initialDoggos = []
    ..add(Dog('Ruby', 'Blue and pink',
        'Ruby es un pulpo', 'https://ae01.alicdn.com/kf/H1100e39f57db4ac59b585bfc10611abar/Juguete-de-peluche-Reversible-pulpo-colorido-mu-eco-de-peluche-regalo-de-cumplea-os-regalo-del.jpg_50x50.jpg'))
    ..add(Dog('Rex', 'Blue and yellow', 'es un pulpo', 'https://ae01.alicdn.com/kf/Hf25763eac4d943e3886dcc14f59a9b48X/Juguete-de-peluche-Reversible-pulpo-colorido-mu-eco-de-peluche-regalo-de-cumplea-os-regalo-del.jpg_50x50.jpg'))
    ..add(Dog('Rod Stewart', 'Red and pink',
        'es un pulpo', 'https://ae01.alicdn.com/kf/H2ea65a0a4e29461ab327ee8a8c1898a7i/Juguete-de-peluche-Reversible-pulpo-colorido-mu-eco-de-peluche-regalo-de-cumplea-os-regalo-del.jpg_50x50.jpg'))
    ..add(Dog('Herbert', 'Green and blue', 'es un pulpo', 'https://ae01.alicdn.com/kf/H704e94b91f66414784564be4dc17c4ad6/Juguete-de-peluche-Reversible-pulpo-colorido-mu-eco-de-peluche-regalo-de-cumplea-os-regalo-del.jpg_50x50.jpg'))
    ..add(Dog('Buddy', 'Green and pink', 'es un pulpo', 'https://ae01.alicdn.com/kf/H640709b5f5244acbb58f92574394c995u/Juguete-de-peluche-Reversible-pulpo-colorido-mu-eco-de-peluche-regalo-de-cumplea-os-regalo-del.jpg_50x50.jpg'));

  Future _showNewDogForm() async {
    Dog newDog = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return AddDogFormPage();
    }));
    if (newDog != null) {
      initialDoggos.add(newDog);
    }
  }

  @override
  Widget build(BuildContext context) {
    var key = new GlobalKey<ScaffoldState>();
    return new Scaffold(
      key: key,
      appBar: new AppBar(
        title: new Text(widget.title),
        backgroundColor: Colors.black87,
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.add),
            onPressed: _showNewDogForm,
          ),
        ],
      ),
      body: new Container(
          decoration: new BoxDecoration(
              gradient: new LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  stops: [
                .1,
                .5,
                .7,
                .9
              ],
                  colors: [
                Colors.indigo[800],
                Colors.indigo[700],
                Colors.indigo[600],
                Colors.indigo[400]
              ])),
          child: new Center(
            child: new DogList(initialDoggos),
          )),
    );
  }
}
