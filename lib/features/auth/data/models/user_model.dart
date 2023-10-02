import '../../domain/entities/user.dart';

class UserModel extends User {
  UserModel(
      {required super.name,
      super.nickname,
      super.jobtitle,
      super.hoursperweek,
      required super.salary,
      super.age});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      nickname: json['nickname'],
      jobtitle: json['jobtitle'],
      hoursperweek: json['hoursperweek'],
      salary: json['salary'],
      age: json['age'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'nickname': nickname,
      'jobtitle': jobtitle,
      'hoursperweek': hoursperweek,
      'salary': salary,
      'age': age,
    };
  }
}
