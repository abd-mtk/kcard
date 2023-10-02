import 'package:equatable/equatable.dart';

class User extends Equatable {
  String name;
  String? nickname;
  String? jobtitle;
  String? hoursperweek;
  double salary;
  int? age;

  User({
    required this.name,
    this.nickname,
    this.jobtitle,
    this.hoursperweek,
    required this.salary,
    this.age,
  });

  @override
  List<Object?> get props =>
      [name, nickname, jobtitle, hoursperweek, salary, age];
}
