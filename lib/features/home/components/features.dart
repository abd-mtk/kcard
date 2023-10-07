import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../user/presentation/screens/profile_screen.dart';
import '../../wallet/presentation/screens/index_screen.dart';

List<Widget> screens = [
  ProfileScreen(),
  Center(
    child: LoadingAnimationWidget.threeRotatingDots(
      color: Colors.blue,
      size: 25,
    ),
  ),
  Center(
    child: LoadingAnimationWidget.threeRotatingDots(
      color: Colors.red,
      size: 25,
    ),
  ),
  WalletIndexScreen(),
];
