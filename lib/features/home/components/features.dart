import 'package:flutter/material.dart';

import '../../dashboard/presentation/screens/dashboard_index_screen.dart';
import '../../transaction/presentation/screens/transction_index_screen.dart';
import '../../user/presentation/screens/profile_screen.dart';
import '../../wallet/presentation/screens/index_screen.dart';

List<Widget> screens = [
  ProfileScreen(),
  DashBoardIndexScreen(),
  TransactionIndexScreen(),
  WalletIndexScreen(),
];
