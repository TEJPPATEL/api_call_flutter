import 'package:FIRST/models/employee.dart';
import 'package:FIRST/service/user-service.dart';
import 'package:flutter/material.dart';

class UserData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
      ),
      body: FutureBuilder<List<Employee>>(
        future: UserService().fetchEmployee(),
        builder: (context, AsyncSnapshot<List<Employee>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data[index].employee_name),
                  );
                },
                itemCount: snapshot.data.length);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
