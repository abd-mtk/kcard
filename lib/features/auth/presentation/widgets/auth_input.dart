import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../app/utils/constants/style.dart';
import 'custom_input_field.dart';

class AuthInput extends StatelessWidget {
  final String label;
  final IconData icon;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool isPassword;

  const AuthInput({
    Key? key,
    required this.label,
    required this.icon,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).primaryColor.withOpacity(0.1),
        ),
        child: Column(
          children: [
            Row(
              children: [
                const Gap(10),
                Text(
                  label,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            CustomInputField(
              controller: controller,
              suffixIcon: Icons.remove_red_eye,
              isPassword: isPassword,
              maxLines: 1,
              maxChars: 100,
              prefixIcon: icon,
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.left,
              keyboardType: keyboardType,
              decoration: const InputDecoration(
                border: border,
                contentPadding: EdgeInsets.symmetric(horizontal: 4),
                focusedBorder: focusedBorder,
                disabledBorder: disabledBorder,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
