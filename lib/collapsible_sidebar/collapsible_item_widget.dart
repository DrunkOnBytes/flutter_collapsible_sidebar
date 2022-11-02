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
    this.minWidth,
    this.onTap,
  });

  final MouseCursor onHoverPointer;
  final Widget leading;
  final String title;
  final TextStyle textStyle;
  final double offsetX, scale, padding;
  final bool? isCollapsed;
  final double? minWidth;
  final VoidCallback? onTap;

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
        return GestureDetector(
          onTap: widget.onTap,
          child: Container(
            color: Colors.transparent,
            padding: EdgeInsets.all(widget.padding),
            child: Stack(
              alignment:
                  (boxConstraints.maxWidth.floor() < widget.minWidth!.floor() && (widget.isCollapsed ?? false))
                      ? Alignment.center
                      : Alignment.centerLeft,
              children: [
                widget.leading,
                _title,
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget get _title {
    return Opacity(
      opacity: widget.scale,
      child: Transform.translate(
        offset: Offset(Directionality.of(context) == TextDirection.ltr ? widget.offsetX : 0, 0),
        child: Transform.scale(
          scale: widget.scale,
          child: SizedBox(
            width: double.infinity,
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
