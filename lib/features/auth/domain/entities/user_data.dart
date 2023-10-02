import 'profile.dart';

class UserData {
    final int id;
    final String name;
    final dynamic emailVerifiedAt;
    final String email;
    final String phoneNumber;
    final int role;
    final bool isActivated;
    final Profile profile;

    UserData({
        required this.id,
        required this.name,
        required this.emailVerifiedAt,
        required this.email,
        required this.phoneNumber,
        required this.role,
        required this.isActivated,
        required this.profile,
    });

}