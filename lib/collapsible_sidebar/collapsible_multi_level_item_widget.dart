import 'package:collapsible_sidebar/collapsible_sidebar/collapsible_item_widget.dart';
import 'package:flutter/material.dart';

class CollapsibleMultiLevelItemWidget extends StatefulWidget {
  const CollapsibleMultiLevelItemWidget({
    required this.mainLevel,
    required this.subItems,
    required this.extendable,
    required this.disable,
    this.iconColor,
    this.onTapMainLevel,
  });

  final Widget mainLevel;
  final List<CollapsibleItemWidget> subItems;
  final bool extendable;
  final bool? disable;
  final Color? iconColor;
  final VoidCallback? onTapMainLevel;

  @override
  _CollapsibleMultiLevelItemWidgetState createState() =>
      _CollapsibleMultiLevelItemWidgetState();
}

class _CollapsibleMultiLevelItemWidgetState
    extends State<CollapsibleMultiLevelItemWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool isOpen = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            if (widget.onTapMainLevel != null) {
              widget.onTapMainLevel!();
            }
            setState(() {
              isOpen = !isOpen;
            });
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: widget.mainLevel,
              ),
              if (widget.disable != null && widget.disable == false)
                Icon(
                  isOpen ? Icons.expand_less : Icons.expand_more,
                  color: widget.iconColor,
                )
            ],
          ),
        ),
        if (widget.disable != null && widget.disable == false)
          AnimatedSize(
            duration: Duration(milliseconds: 300),
            child: Container(
              height: widget.extendable == true && isOpen ? null : 0,
              child: Column(
                children: widget.subItems,
              ),
            ),
          ),
      ],
    );
  }
}
