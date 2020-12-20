import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Third"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [Text("THank you on Third Screen")],
        ),
      ),
    );
  }
}
