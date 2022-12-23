import 'package:flutter/material.dart';

import 'app_color.dart';

class TagChip extends StatelessWidget {
  const TagChip({
    required this.label,
    required this.onDeleted,
    required this.index,
    required this.icon,
  });

  final Icon icon;
  final String label;
  final ValueChanged<int> onDeleted;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Chip(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      backgroundColor: AppColors.customBlue.withOpacity(0.08),
      labelPadding: const EdgeInsets.only(left: 8.0),
      label: Text(
        label,
        style: const TextStyle(
          fontSize: 13,
          fontFamily: 'Euclid',
          color: AppColors.customBlue,
          fontWeight: FontWeight.w400,
        ),
      ),
      deleteIcon: icon,
      onDeleted: () {
        onDeleted(index);
      },
    );
  }
}
