import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

List<PageViewModel> introductionList = [
  PageViewModel(
    title: "t1",
    body: "b1",
    image: Center(
      child: Image.asset("assets/images/money.png", height: 175.0),
    ),
  ),
  PageViewModel(
    title: "t2",
    body: "b2",
    image: Center(
      child: Image.asset("assets/images/pay.png", height: 175.0),
    ),
  ),
  PageViewModel(
    title: "t3",
    body: "b3",
    image: Center(
      child: Image.asset("assets/images/budget.png", height: 175.0),
    ),
  ),
  PageViewModel(
    title: "t4",
    body: "b4",
    image: Center(
      child: Image.asset("assets/images/dashboard.png", height: 175.0),
    ),
  ),
];
