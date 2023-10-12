import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'transaction_edit.dart';

// ignore: must_be_immutable
class TransactionType extends StatefulWidget {
  final TextEditingController type;
  final TextEditingController resipient;
  bool isSend = true;

  TransactionType({
    Key? key,
    required this.type,
    required this.resipient,
  }) : super(key: key);

  @override
  State<TransactionType> createState() => _TransactionTypeState();
}

class _TransactionTypeState extends State<TransactionType> {
  bool send = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ToggleSwitch(
          minWidth: 150.0,
          minHeight: 50.0,
          initialLabelIndex: send ? 0 : 1,
          cornerRadius: 20.0,
          changeOnTap: false,
          doubleTapDisable: false,
          activeFgColor: Colors.white,
          // inactiveBgColor: Colors.grey[500],
          inactiveFgColor: Colors.white,
          totalSwitches: 2,
          animationDuration: 50,
          icons: const [
            Icons.arrow_upward,
            Icons.arrow_downward,
          ],
          labels: const ['Send', 'Receive'],
          iconSize: 30.0,
          activeBgColors: [
            [Colors.green[900]!, Colors.green],
            [Colors.red[900]!, Colors.pink]
          ],
          animate: true,
          curve: Curves
              .easeInToLinear, // animate must be set to true when using custom curve
          onToggle: (index) {
            setState(() {
              if (index == 0) {
                widget.type.text = "Send";
                send = true;
              } else {
                widget.type.text = "Receive";
                send = false;
              }
            });
          },
        ),
        const Gap(20),
        send
            ? EditTransctionFiled(
                label: 'Send To',
                icon: Iconsax.send_square,
                controller: widget.resipient,
                keyboardType: TextInputType.text,
              )
            : const SizedBox(),
        !send
            ? EditTransctionFiled(
                label: 'Receive From',
                icon: Iconsax.receive_square,
                controller: widget.resipient,
                keyboardType: TextInputType.text,
              )
            : const SizedBox(),
        const Gap(20),
      ],
    );
  }
}
