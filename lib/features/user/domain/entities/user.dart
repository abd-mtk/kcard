import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String name;
  final String? nickname;
  final String? jobtitle;
  final String? hoursperweek;
  final double salary;
  final int? age;

  const User({
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
