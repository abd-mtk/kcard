import 'package:flutter/material.dart';

import '../../../../app/utils/constants/style.dart';

class CustomInputField extends StatefulWidget {
  final TextEditingController controller;
  final IconData suffixIcon;
  final bool isPassword;
  final int maxLines;
  final int maxChars;
  final IconData? prefixIcon;
  final TextDirection textDirection;
  final TextAlign textAlign;
  final InputDecoration decoration;
  final TextInputType keyboardType;

  const CustomInputField({
    Key? key,
    required this.controller,
    required this.suffixIcon,
    this.isPassword = false,
    this.maxLines = 1,
    this.maxChars = 100,
    this.prefixIcon,
    this.textDirection = TextDirection.ltr,
    this.textAlign = TextAlign.left,
    this.decoration = const InputDecoration(
      border: border,
      contentPadding: EdgeInsets.symmetric(horizontal: 4),
      focusedBorder: focusedBorder,
      disabledBorder: disabledBorder,
    ),
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CustomInputFieldState createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  bool _showPassword = false;

  void _togglePasswordVisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: widget.controller,
        obscureText: widget.isPassword && !_showPassword,
        maxLines: widget.maxLines,
        maxLength: widget.maxChars,
        textAlign: widget.textAlign,
        keyboardType: widget.keyboardType,
        decoration: widget.decoration.copyWith(
          hintTextDirection: widget.textDirection,
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    widget.suffixIcon,
                    color: widget.isPassword && !_showPassword
                        ? Theme.of(context).primaryColor
                        : Colors.grey,
                  ),
                  onPressed: _togglePasswordVisibility,
                )
              : null,
          prefixIcon:
              widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
        ),
      ),
    );
  }
}
