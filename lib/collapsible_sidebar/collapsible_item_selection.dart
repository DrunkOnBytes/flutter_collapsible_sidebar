import 'package:flutter/material.dart';

class CollapsibleItemSelection extends StatefulWidget {
  const CollapsibleItemSelection({
    required this.height,
    required this.offsetY,
    required this.color,
    required this.duration,
    required this.curve,
  });

  final double height, offsetY;
  final Color color;
  final Duration duration;
  final Curve curve;

  @override
  _CollapsibleItemSelectionState createState() =>
      _CollapsibleItemSelectionState();
}

class _CollapsibleItemSelectionState extends State<CollapsibleItemSelection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _offsetYAnimation;
  late CurvedAnimation _curvedAnimation;
  late double _oldOffsetY;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _curvedAnimation = CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    );

    _offsetYAnimation = _createAnimation(0, widget.offsetY);

    _oldOffsetY = widget.offsetY;
    _controller.addListener(() => setState(() {}));
    _controller.forward();
  }

  @override
  void didUpdateWidget(CollapsibleItemSelection oldWidget) {
    if (_oldOffsetY == widget.offsetY) return;

    _offsetYAnimation = _createAnimation(_oldOffsetY, widget.offsetY);
    _oldOffsetY = widget.offsetY;
    _controller.reset();
    _controller.forward();

    super.didUpdateWidget(oldWidget);
  }

  Animation<double> _createAnimation(double begin, double end) {
    return Tween<double>(
      begin: begin,
      end: end,
    ).animate(_curvedAnimation);
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, _offsetYAnimation.value),
      child: Container(
        width: double.infinity,
        height: widget.height,
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
