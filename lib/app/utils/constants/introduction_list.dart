import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

List<PageViewModel> introductionList = [
  PageViewModel(
    title: "The Professional's Choice for Financial Management",
    body: "Manage your money like a pro with KCard App",
    image: Center(
      child: Image.asset("assets/images/money.png", height: 175.0),
    ),
  ),
  PageViewModel(
    title: "Transfer Money",
    body: "Transfer money to your friends and family",
    image: Center(
      child: Image.asset("assets/images/pay.png", height: 175.0),
    ),
  ),
  PageViewModel(
    title: "Calculate Budget and Expenses",
    body: "Calculate all your expenses and budget and payments",
    image: Center(
      child: Image.asset("assets/images/budget.png", height: 175.0),
    ),
  ),
  PageViewModel(
    title: "Dashboard",
    body: "View all your transactions and payments in one place",
    image: Center(
      child: Image.asset("assets/images/dashboard.png", height: 175.0),
    ),
  ),
];
