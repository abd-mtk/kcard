import 'package:flutter/material.dart';

import 'body_card.dart';
import 'head_card.dart';

class ProfileCrad extends StatelessWidget {
  final String? jobtype;
  final double? salary;
  final String? curranecy;
  final String? username;
  final String? jobtitle;
  final String? experience;

  const ProfileCrad({
    super.key,
    required this.jobtype,
    required this.salary,
    required this.curranecy,
    required this.username,
    required this.jobtitle,
    this.experience,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.black38,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        child:  Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              HeadCard(
                jobtype: jobtype,
                salary: salary,
                curranecy: curranecy,
              ),
              const Divider(
                thickness: 2,
                color: Colors.white70,
                endIndent: 5,
                indent: 5,
              ),
              BodyCard(
                username: username,
                jobtitle: jobtitle,
                experience: experience,
              ),
            ],
          ),
        ));
  }
}
