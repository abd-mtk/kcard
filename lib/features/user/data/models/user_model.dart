import '../../domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.name,
    super.nickname,
    super.jobtitle,
    required super.receipt,
    required super.salary,
    required super.curranecy,
    required super.workingmode,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      nickname: json['nickname'],
      jobtitle: json['jobtitle'],
      receipt: json['receipt'],
      salary: json['salary'],
      curranecy: json['curranecy'],
      workingmode: json['workingmode'],
    );
  }

  factory UserModel.fromEntity(User user) {
    return UserModel(
      name: user.name,
      nickname: user.nickname,
      jobtitle: user.jobtitle,
      receipt: user.receipt,
      salary: user.salary,
      curranecy: user.curranecy,
      workingmode: user.workingmode,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'nickname': nickname,
      'jobtitle': jobtitle,
      'receipt': receipt,
      'salary': salary,
      'curranecy': curranecy,
      'workingmode': workingmode,
    };
  }
}
