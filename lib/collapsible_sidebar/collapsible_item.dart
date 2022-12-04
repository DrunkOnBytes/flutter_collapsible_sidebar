import 'package:flutter/material.dart';

class CollapsibleItem {
  CollapsibleItem({
    required this.text,
    required this.icon,
    required this.onPressed,
    this.showBadge = false,
    this.badgeContent,
    this.isSelected = false,
    this.badgeColor = Colors.red,
  });

  final String text;
  final IconData icon;
  final Function onPressed;
  bool isSelected;
  bool showBadge;
  Color badgeColor;
  Widget? badgeContent;
}
