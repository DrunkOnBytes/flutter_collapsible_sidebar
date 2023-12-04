import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CollapsibleItem {
  CollapsibleItem({
    required this.text,
    this.badgeCount,
    this.icon,
    this.iconImage,
    required this.onPressed,
    this.onHold,
    this.isSelected = false,
    this.subItems,
    this.toolTip,
  });

  final String text;
  int? badgeCount;
  IconData? icon;
  ImageProvider? iconImage;
  final Function onPressed;
  final Function? onHold;
  bool isSelected;
  List<CollapsibleItem>? subItems;
  /// Tip to use when collapsed (e.g. during mouse-over in web)
  String? toolTip;
}
