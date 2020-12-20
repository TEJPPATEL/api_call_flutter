import 'dart:convert';

import 'package:FIRST/models/user.dart';
import 'package:http/http.dart' as http;

class APiServiceUtility {
  // Future<http.Response> fetchAlbum() {
  //   return http.get('https://jsonplaceholder.typicode.com/users');
  // }

  Future<List<User>> fetchUsers() async {
    final response =
        await http.get('https://jsonplaceholder.typicode.com/users');

    if (response.statusCode == 200) {
      final responseBody = await json.decode(response.body) as List<dynamic>;
      List<User> users =
          responseBody.map((user) => User.fromJson(user)).toList();
      print(users);
      return users;
    } else {
      throw Exception('Failed to load Data');
    }
  }
}
