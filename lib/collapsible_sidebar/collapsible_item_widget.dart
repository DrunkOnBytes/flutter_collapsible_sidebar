import 'package:flutter/material.dart';

class CollapsibleItemWidget extends StatelessWidget {
  const CollapsibleItemWidget({
    @required this.leading,
    @required this.title,
    @required this.textStyle,
    @required this.padding,
    @required this.offsetX,
    @required this.scale,
    this.onTap,
  });

  final Widget leading;
  final String title;
  final TextStyle textStyle;
  final double offsetX, scale, padding;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        padding: EdgeInsets.all(padding),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            leading,
            _title,
          ],
        ),
      ),
    );
  }

  Widget get _title {
    return Opacity(
      opacity: scale,
      child: Transform.translate(
        offset: Offset(offsetX, 0),
        child: Transform.scale(
          scale: scale,
          child: SizedBox(
            width: double.infinity,
            child: Text(
              title,
              style: textStyle,
              softWrap: false,
              overflow: TextOverflow.fade,
            ),
          ),
        ),
      ),
    );
  }
}
