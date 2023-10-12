import 'package:get/get.dart';

import '../../../../features/user/presentation/getx/bindings/edit_profile_binding.dart';
import '../../../../features/user/presentation/getx/bindings/profile_binding.dart';
import '../../../../features/user/presentation/screens/edit_profile_screen.dart';
import '../../../../features/user/presentation/screens/profile_screen.dart';
import '../../../../features/user/presentation/screens/setting_screen.dart';

// ignore: non_constant_identifier_names
List<GetPage<dynamic>> USER = [
  GetPage(
    name: ProfileScreen.routeName,
    page: () => ProfileScreen(),
    bindings: [
      ProfileBinding(),
    ],
  ),
  GetPage(
    name: EditProfileScreen.routeName,
    page: () => EditProfileScreen(),
    bindings: [
      EditProfileBinding(),
    ],
  ),
  GetPage(
    name: SettingScreen.routeName,
    page: () => SettingScreen(),
  ),
];
