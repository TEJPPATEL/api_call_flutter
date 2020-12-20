import 'dart:convert';
import 'dart:io';

import 'package:FIRST/models/employee.dart';
import 'package:http/http.dart' as http;

String BASE_URL = 'http://dummy.restapiexample.com/api/v1/';

class UserService {
  Future<List<Employee>> fetchEmployee() async {
    final response = await http.get(BASE_URL + 'employees');
    if (response.statusCode == 200) {
      final employeesData = json.decode(response.body)['data'] as List<dynamic>;
      // print(employeesData);
      List<Employee> employees =
          employeesData.map((employee) => Employee.fromJson(employee)).toList();
      return employees;
    } else {
      throw Exception('Failed to load Data');
    }
  }

  // Future postEmployee(name, salary, age) {
  //   final sendData = json.encode({'name': name, 'salary': salary, 'age': age});
  //   final response = http.post(BASE_URL + 'create', body: sendData).then((res) {
  //     // print(res.body);
  //     if (res.statusCode == 200) {
  //       final body = json.decode(res.body) as Map<String, dynamic>;
  //       return body;
  //     } else {
  //       throw Exception('Failed To Post Data');
  //     }
  //   });
  // }

  Future postEmployee(name, salary, age) async {
    final sendData = json.encode({'name': name, 'salary': salary, 'age': age});
    return await http.post(BASE_URL + 'create', body: sendData);
  }
}
