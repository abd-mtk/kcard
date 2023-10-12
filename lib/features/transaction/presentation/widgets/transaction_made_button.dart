import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class TransactionMadeButton extends StatelessWidget {
  const TransactionMadeButton({
    super.key,
    required this.onPressed,
  });
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8, left: 40, right: 40),
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.pink[900],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 2,
        ),
        child: const SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Transaction Made',
                style: TextStyle(fontSize: 14),
              ),
              Icon(Iconsax.wallet_add_1),
            ],
          ),
        ),
      ),
    );
  }
}
