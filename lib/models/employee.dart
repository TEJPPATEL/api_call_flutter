class Employee {
  String id;
  String employee_name;
  String employee_salary;
  String employee_age;
  String profile_image;

  Employee(
      {this.id,
      this.employee_name,
      this.employee_salary,
      this.employee_age,
      this.profile_image});
  factory Employee.fromJson(Map<dynamic, dynamic> json) {
    return Employee(
        id: json['id'],
        employee_name: json['employee_name'],
        employee_salary: json['employee_salary'],
        employee_age: json['employee_age'],
        profile_image: json['profile_image']);
  }
  
}
