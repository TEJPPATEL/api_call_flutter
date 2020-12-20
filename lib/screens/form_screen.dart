import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  RegExp emailRegex = new RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          color: Colors.red,
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.menu),
        //     onPressed: () {},
        //   )
        // ],
        title: Container(
          alignment: Alignment.centerRight,
          child: Text(
            "User Registration",
            style: TextStyle(color: Colors.red),
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Form(
          key: _formkey,
          child: Container(
            height: height * 0.5,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Name",
                        hintText: "Enter Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) =>
                          value.isEmpty ? "Please Enter Name" : null,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter Mobile Number",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) => value.isNotEmpty &&
                              value.length == 10 &&
                              int.tryParse(value) != null
                          ? null
                          : "Please Enter Number",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter Mail Id",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) => emailRegex.hasMatch(value)
                          ? null
                          : "Please Enter Valid Email",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      minLines: 5,
                      maxLines: 6,
                      decoration: InputDecoration(
                        hintText: "Enter Feedback(optional)",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      print(_formkey.currentState.validate());
                    },
                    child: Text("Submit"),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
