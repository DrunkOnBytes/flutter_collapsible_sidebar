import 'package:flutter/material.dart';

class CollapsibleItemWidget extends StatefulWidget {
  const CollapsibleItemWidget({
    required this.leading,
    required this.title,
    required this.textStyle,
    required this.padding,
    required this.offsetX,
    required this.scale,
    this.onTap,
  });

  final Widget leading;
  final String title;
  final TextStyle textStyle;
  final double offsetX, scale, padding;
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
          _underline = true;
        });
      },
      onExit: (event) {
        setState(() {
          _underline = false;
        });
      },
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          color: Colors.transparent,
          padding: EdgeInsets.all(widget.padding),
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              widget.leading,
              _title,
            ],
          ),
        ),
      ),
    );
  }

  Widget get _title {
    return Opacity(
      opacity: widget.scale,
      child: Transform.translate(
        offset: Offset(widget.offsetX, 0),
        child: Transform.scale(
          scale: widget.scale,
          child: SizedBox(
            width: double.infinity,
            child: Text(
              widget.title,
              style: _underline
                  ? widget.textStyle
                      .merge(TextStyle(decoration: TextDecoration.overline))
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
