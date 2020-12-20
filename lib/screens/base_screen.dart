import 'package:FIRST/screens/second_screen.dart';
import 'package:flutter/material.dart';

class BaseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BASE"),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Good Morning "),
            Text("This is Base Screen"),
            RaisedButton(
              child: Text("Navigate"),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SecondScreen(
                            name: "Tej",
                          ))),
            )
          ],
        ),
      ),
    );
  }
}
