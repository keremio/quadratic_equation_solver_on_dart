import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: new HomePage(),
      theme: new ThemeData(primarySwatch: Colors.blue),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  TextEditingController myController1 = new TextEditingController();
  TextEditingController myController2 = new TextEditingController();
  TextEditingController myController3 = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.white,
        body: new Container(
          padding: const EdgeInsets.all(40.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new TextField(
                controller: myController1,
                decoration: new InputDecoration(
                    labelText: "Enter the coefficient a"),
                // Only numbers can be entered
              ),
              new TextField(
                controller: myController2,
                decoration: new InputDecoration(
                    labelText: "Enter the coefficient b"),
             ),
              new TextField(
                controller: myController3,
                decoration: new InputDecoration(
                    labelText: "Enter the coefficient c"),
                 // Only numbers can be entered
              ),
              new FloatingActionButton(
                onPressed: () {
                  return showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        // Retrieve the text the that user has entered by using the
                        // TextEditingController.
                          content: Text( "The discriminant is: " + d().toString() + "." + "\n" + "The roots are: " +
                              calc1real() + " + " + calc1im() + " and " + calc2real() + " + " + calc2im()));
                    },
                  );
                },
                tooltip: 'Show me the value!',
                child: Icon(Icons.text_fields),
              ),
            ],
          ),
        )
    );
  }

  double d()
  {
    var a = double.parse(myController1.text);
    var b = double.parse(myController2.text);
    var c = double.parse(myController3.text);
    return (pow(b, 2) - 4 * a * c);
  }

  String calc1real() {
    var a = double.parse(myController1.text);
    var b = double.parse(myController2.text);
    if (d() >= 0) {
      var x1 = (-1 * b + sqrt(d())) / (2 * a);
      return (x1.toString());
    }
    else {
      var t = -1*(b / (2*a));
      return(t.toString());
    }
  }

  String calc1im()
  {
    var a = double.parse(myController1.text);
    if (d() >= 0) {
      return ("0i");
  }
    else
      {
        var x = 1 * sqrt(-1*d()) / (2*a);
        return(x.toString()+ "i");
      }
  }

  String calc2real() {
    var a = double.parse(myController1.text);
    var b = double.parse(myController2.text);
    if (d() >= 0) {
      var x2 = (-1 * b - sqrt(d())) / (2 * a);
      return (x2.toString());
    }
    else {
      var t = -1*(b / (2*a));
      return(t.toString());
    }
  }

  String calc2im()
  {
    var a = double.parse(myController1.text);
    var b = double.parse(myController2.text);
    if (d() >= 0) {
      return ("0i");
    }
    else
    {
      var x = -1 * sqrt(-1*d()) / (2*a);
      return(x.toString() + "i" );
    }
  }

}