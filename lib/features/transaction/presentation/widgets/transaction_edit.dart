import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../app/utils/constants/style.dart';
import 'custom_input_field.dart';

class EditTransctionFiled extends StatelessWidget {
  final String label;
  final IconData icon;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final EdgeInsets padding;
  final int maxLines;
  final int maxChars;

  const EditTransctionFiled({
    Key? key,
    required this.label,
    required this.icon,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.padding = const EdgeInsets.only(left: 0, right: 0),
    this.maxLines = 1,
    this.maxChars = 100,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Gap(10),
              Text(
                label,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
          Padding(
            padding: padding,
            child: CustomInputField(
              controller: controller,
              suffixIcon: Icons.edit,
              isPassword: false,
              maxLines: maxLines,
              maxChars: maxChars,
              prefixIcon: icon,
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.left,
              keyboardType: keyboardType,
              decoration: const InputDecoration(
                border: border,
                focusedBorder: focusedBorder,
                disabledBorder: disabledBorder,
              ),
            ),
          ),
          const Divider(
              thickness: 2, color: Colors.black26, endIndent: 10, indent: 10),
        ],
      ),
    );
  }
}
