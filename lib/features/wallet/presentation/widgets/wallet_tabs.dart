import 'package:flutter/material.dart';

const List<Widget> walletTabs = [
  Tab(
    icon: Icon(Icons.account_balance_wallet),
    child: Text('Budget Details',
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontFamily: 'Aref_Ruqaa_Ink',
        )),
  ),
  Tab(
    icon: Icon(Icons.edit),
    child: Text('Edit Budget',
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontFamily: 'Aref_Ruqaa_Ink',
        )),
  ),
  Tab(
    icon: Icon(Icons.money_off),
    child: Text('Expenses',
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontFamily: 'Aref_Ruqaa_Ink',
        )),
  ),
  Tab(
    icon: Icon(Icons.add),
    child: Text('Add Expense',
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontFamily: 'Aref_Ruqaa_Ink',
        )),
  ),
];
