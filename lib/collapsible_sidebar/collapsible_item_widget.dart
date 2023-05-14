import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'package:collapsible_sidebar/collapsible_sidebar/collapsible_multi_level_item_widget.dart';
import 'package:flutter/material.dart';

class CollapsibleItemWidget extends StatefulWidget {
  const CollapsibleItemWidget({
    required this.onHoverPointer,
    required this.leading,
    required this.title,
    required this.textStyle,
    required this.padding,
    required this.offsetX,
    required this.scale,
    this.isCollapsed,
    this.isSelected,
    this.minWidth,
    this.onTap,
    this.subItems,
    this.onLongPress,
    this.iconSize,
    this.iconColor,
    this.parentComponent,
  });

  final MouseCursor onHoverPointer;
  final Widget leading;
  final String title;
  final TextStyle textStyle;
  final double offsetX, scale, padding;
  final bool? isCollapsed;
  final bool? isSelected;
  final double? minWidth;
  final VoidCallback? onTap;
  final List<CollapsibleItem>? subItems;
  final double? iconSize;
  final Color? iconColor;
  final bool? parentComponent;
  final VoidCallback? onLongPress;

  @override
  _CollapsibleItemWidgetState createState() => _CollapsibleItemWidgetState();
}

class _CollapsibleItemWidgetState extends State<CollapsibleItemWidget> {
  bool _underline = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          _underline = true && widget.onTap != null;
        });
      },
      onExit: (event) {
        setState(() {
          _underline = false;
        });
      },
      cursor: widget.onHoverPointer,
      child: LayoutBuilder(builder: (context, boxConstraints) {
        return Container(
          color: Colors.transparent,
          padding: EdgeInsets.all(widget.padding),
          child: widget.subItems == null
              ? GestureDetector(
                  onTap: widget.onTap,
                  onLongPress: widget.onLongPress,
                  child: Row(
                    children: [
                      widget.leading,
                      _title,
                    ],
                  ),
                )
              : CollapsibleMultiLevelItemWidget(
                  onHoverPointer: widget.onHoverPointer,
                  textStyle: widget.textStyle,
                  offsetX: widget.offsetX,
                  isSelected: widget.isSelected,
                  scale: widget.scale,
                  padding: widget.padding,
                  minWidth: widget.minWidth,
                  isCollapsed: widget.isCollapsed,
                  parentComponent: widget.parentComponent,
                  onHold: widget.onLongPress,
                  mainLevel: Row(
                    children: [
                      Flexible(child: widget.leading),
                      _title,
                    ],
                  ),
                  onTapMainLevel: widget.onTap,
                  subItems: widget.subItems!,
                  extendable:
                      widget.isCollapsed != false || widget.isSelected != false,
                  disable: widget.isCollapsed,
                  iconColor: widget.iconColor,
                  iconSize: widget.iconSize,
                ),
        );
      }),
    );
  }

  Widget get _title {
    return Expanded(
      child: Opacity(
        opacity: widget.scale,
        child: Transform.translate(
          offset: Offset(
            Directionality.of(context) == TextDirection.ltr
                ? widget.offsetX
                : 0,
            0,
          ),
          child: Transform.scale(
            scale: widget.scale,
            child: Text(
              widget.title,
              style: _underline
                  ? widget.textStyle
                      .merge(TextStyle(decoration: TextDecoration.underline))
                  : widget.textStyle,
              softWrap: false,
              overflow: TextOverflow.fade,
            ),
          ),
        ),
      ),
    );
  }
}
