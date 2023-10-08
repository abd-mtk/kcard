import 'package:get/get.dart';

import 'auth/auth_routes.dart';
import 'user/user_routes.dart';
import 'wallet/wallet_routes.dart';

// ignore: non_constant_identifier_names
List<GetPage<dynamic>>? ROUTER = [
  ...AUTH,
  ...USER,
  ...WALLET,
];
