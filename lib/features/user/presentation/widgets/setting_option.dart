import 'package:flutter/material.dart';

class SettingOption extends StatelessWidget {
  final String option;
  final IconData icon;
  final Function() onTap;
  const SettingOption({
    Key? key,
    required this.option,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              option,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            IconButton(
              icon: Icon(icon, size: 35),
              onPressed: onTap,
            ),
          ],
        ),
      ),
    );
  }
}
