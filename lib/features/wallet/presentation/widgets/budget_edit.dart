import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../app/utils/constants/style.dart';
import 'custom_input_field.dart';

class EditBudgetFiled extends StatelessWidget {
  final String label;
  final IconData icon;
  final TextEditingController controller;
  final TextInputType keyboardType;

  const EditBudgetFiled({
    Key? key,
    required this.label,
    required this.icon,
    required this.controller,
    this.keyboardType = TextInputType.text,
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
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          CustomInputField(
            controller: controller,
            suffixIcon: Icons.edit,
            isPassword: false,
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
          const Divider(
              thickness: 2, color: Colors.black26, endIndent: 10, indent: 10),
        ],
      ),
    );
  }
}
