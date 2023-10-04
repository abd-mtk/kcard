import 'package:get/get.dart';

import '../../../../features/user/presentation/screens/edit_profile_screen.dart';
import '../../../../features/user/presentation/screens/profile_screen.dart';
import '../../../../features/user/presentation/screens/setting_screen.dart';

// ignore: non_constant_identifier_names
List<GetPage<dynamic>> USER = [
  GetPage(
    name: ProfileScreen.routeName,
    page: () => ProfileScreen(),
  ),
  GetPage(
    name: EditProfileScreen.routeName,
    page: () => const EditProfileScreen(),
  ),
  GetPage(
    name: SettingScreen.routeName,
    page: () => const SettingScreen(),
  ),
];
