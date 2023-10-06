import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String name;
  final String? nickname;
  final String? jobtitle;
  final String workingmode;
  final double salary;
  final String curranecy;
  final String receipt;

  const User({
    required this.name,
    this.nickname,
    this.jobtitle,
    required this.workingmode,
    required this.salary,
    required this.curranecy,
    required this.receipt,
  });

  @override
  List<Object?> get props => [name, nickname, jobtitle, workingmode, salary,curranecy, receipt];
}
