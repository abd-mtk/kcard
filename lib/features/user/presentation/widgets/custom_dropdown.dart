import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:cool_dropdown/models/cool_dropdown_item.dart';
import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  final String label;
  final List<CoolDropdownItem> items;
  final TextEditingController controller;
  final int defaultItem;

  const CustomDropDown({
    super.key,
    required this.label,
    required this.items,
    required this.controller,
    required this.defaultItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey[50],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(label,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                CoolDropdown(
                  dropdownList: items,
                  onChange: (dropdownItem) {
                    controller.text = dropdownItem.toString();
                  },
                  controller: DropdownController(),
                  defaultItem: items[defaultItem],
                ),
              ],
            ),
          ),
          const Divider(
              thickness: 2, color: Colors.black26, endIndent: 10, indent: 10),
        ],
      ),
    );
  }
}
