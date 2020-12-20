import 'package:FIRST/models/user.dart';
import 'package:FIRST/service/api-service.dart';
import 'package:flutter/material.dart';

class ApiUtility extends StatefulWidget {
  @override
  _ApiUtilityState createState() => _ApiUtilityState();
}

class _ApiUtilityState extends State<ApiUtility> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AppBar"),
        actions: [
          IconButton(icon: Icon(Icons.add_location), onPressed: onButtonClick)
        ],
      ),
      body: Column(
        children: [
          FutureBuilder(
            future: APiServiceUtility().fetchUsers(),
            builder:
                (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
                  if(snapshot.hasData){
                    return Container(
                      child: Column(children: [
                        // Row(children: [Text(snapshot.data['name'])],)
                      ],),
                    );
                  }
                  else{
                    CircularProgressIndicator();
                  }
                },
          )
        ],
      ),
    );
  }

  void onButtonClick() {}
}
