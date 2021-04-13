import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CollapsibleItem {
  CollapsibleItem({
    required this.text,
    required this.icon,
    required this.onPressed,
    this.isSelected = false,
  });

  final String text;
  final IconData icon;
  final Function onPressed;
  bool isSelected;
}
