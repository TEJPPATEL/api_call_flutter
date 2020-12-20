import 'package:FIRST/screens/user_data.dart';
import 'package:FIRST/service/user-service.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();
  final userName = TextEditingController();
  final userSalary = TextEditingController();
  final userAge = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Registration"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                      controller: userName,
                      decoration: InputDecoration(
                          labelText: 'Name',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: "Enter Name"),
                      validator: (value) =>
                          value.isEmpty ? "Please Enter Username" : null),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                      controller: userSalary,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'Salary',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: "Enter Salary"),
                      validator: (value) =>
                          value.isEmpty ? "Please Enter Salary" : null),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: userAge,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Age',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: "Enter Age"),
                    validator: (value) =>
                        value.isEmpty ? "Please Enter Age" : null,
                  ),
                ),
                RaisedButton(
                  color: Colors.blue,
                  onPressed: () {
                    _formkey.currentState.save();
                    if (_formkey.currentState.validate()) {
                      UserService()
                          .postEmployee(
                              userName.text, userSalary.text, userAge.text)
                          .then((res) => {
                                if (res.statusCode == 200)
                                  {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => UserData()))
                                  }
                              });
                    }
                  },
                  child: Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
