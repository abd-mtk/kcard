import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

const List<Widget> transactionTabs = [
  Tab(
    text: 'Sent Transaction',
    icon: Icon(Iconsax.send_2),
  ),
  Tab(
    text: 'Received Transaction',
    icon: Icon(Iconsax.receive_square),
  ),
  Tab(
    text: 'Create Transaction',
    icon: Icon(Iconsax.add),
  ),
];
