import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class BodyCard extends StatelessWidget {
  final String? username;
  final String? jobtitle;
  final String? experience;

  const BodyCard({
    super.key,
    required this.username,
    required this.jobtitle,
     this.experience,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Iconsax.user, size: 35),
                Text(
                  '  $username',
                ),
              ],
            ),
            const Divider(
              thickness: 2,
              color: Colors.white70,
              endIndent: 5,
              indent: 5,
            ),
            Row(
              children: [
                const Icon(HeroIcons.briefcase, size: 35),
                Text(
                  '  $jobtitle',
                ),
              ],
            ),
            const Divider(
              thickness: 2,
              color: Colors.white70,
              endIndent: 5,
              indent: 5,
            ),
            experience == null
                ? const SizedBox()
                :
            Row(
              children: [
                const Icon(Iconsax.brifecase_timer, size: 35),
                Text(
                  '  $experience',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}