import '../../domain/entities/register.dart';

class RegisterModel extends Register {
  RegisterModel(
      {required super.firstName,
      required super.middleName,
      required super.lastName,
      required super.password,
      required super.gender,
      required super.phoneNumber,
      required super.dateOfBirth,
      required super.province,
      required super.city,
      required super.email});

  Map<String, dynamic> toJson() {
    return {
      "first_name": firstName,
      "middle_name": middleName,
      "last_name": lastName,
      "password": password,
      "gender": gender,
      "phone_number": phoneNumber,
      "date_of_birth": dateOfBirth,
      "province": province,
      "city": city,
      "email": email,
    };
  }
}
