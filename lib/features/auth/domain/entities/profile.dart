import 'province.dart';

class Profile {
  final DateTime dateOfBirth;
  final String gender;
  final Province province;
  final String city;

  Profile({
    required this.dateOfBirth,
    required this.gender,
    required this.province,
    required this.city,
  });
}
