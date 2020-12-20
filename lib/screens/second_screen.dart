import 'package:FIRST/screens/Third_screen.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  String name;
  SecondScreen({this.name});

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Container(
        color: Colors.green,
        alignment: Alignment.center,
        child: Column(
          children: [
            Text("Thank you for Welcoming on this second page" + widget.name),
            RaisedButton(
                child: Text("Third Screen"),
                onPressed: () => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => ThirdScreen()),
                    (route) => false)),
            Text("Counter : $_counter"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add), onPressed: () => _incrementCount()),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  _incrementCount() {
    setState(() {
      _counter = _counter + 1;
    });
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ThirdScreen()));
  }
}
