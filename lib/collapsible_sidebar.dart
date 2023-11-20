library collapsible_sidebar;

import 'dart:math' as math show pi;

import 'package:collapsible_sidebar/collapsible_sidebar/collapsible_avatar.dart';
import 'package:collapsible_sidebar/collapsible_sidebar/collapsible_container.dart';
import 'package:collapsible_sidebar/collapsible_sidebar/collapsible_item.dart';
import 'package:collapsible_sidebar/collapsible_sidebar/collapsible_item_selection.dart';
import 'package:collapsible_sidebar/collapsible_sidebar/collapsible_item_widget.dart';
import 'package:flutter/material.dart';

export 'package:collapsible_sidebar/collapsible_sidebar/collapsible_item.dart';

class CollapsibleSidebar extends StatefulWidget {
  const CollapsibleSidebar({
    Key? key,
    required this.items,
    required this.body,
    this.title = 'Lorem Ipsum',
    this.titleStyle,
    this.titleBack = false,
    this.titleBackIcon = Icons.arrow_back,
    this.onHoverPointer = SystemMouseCursors.click,
    this.textStyle,
    this.toggleTitleStyle,
    this.toggleTitle = 'Collapse',
    this.avatarImg,
    this.height = double.infinity,
    this.minWidth = 80,
    this.maxWidth = 270,
    this.borderRadius = 15,
    this.iconSize = 40,
    this.customContentPaddingLeft = -1,
    this.toggleButtonIcon = Icons.chevron_right,
    this.backgroundColor = const Color(0xff2B3138),
    this.avatarBackgroundColor = const Color(0xff6A7886),
    this.selectedIconBox = const Color(0xff2F4047),
    this.selectedIconColor = const Color(0xff4AC6EA),
    this.selectedTextColor = const Color(0xffF3F7F7),
    this.unselectedIconColor = const Color(0xff6A7886),
    this.unselectedTextColor = const Color(0xffC0C7D0),
    this.badgeBackgroundColor = const Color(0xffFF6767),
    this.badgeTextColor = const Color(0xffF3F7F7),
    this.duration = const Duration(milliseconds: 500),
    this.curve = Curves.fastLinearToSlowEaseIn,
    this.screenPadding = 4,
    this.showToggleButton = true,
    this.topPadding = 0,
    this.bottomPadding = 0,
    this.itemPadding = 10,
    this.customItemOffsetX = -1,
    this.fitItemsToBottom = false,
    this.onTitleTap,
    this.isCollapsed = true,
    this.collapseOnBodyTap = true,
    this.showTitle = true,
    this.sidebarBoxShadow = const [
      BoxShadow(
        color: Colors.blue,
        blurRadius: 10,
        spreadRadius: 0.01,
        offset: Offset(3, 3),
      ),
    ],
  }) : super(key: key);

  final avatarImg;
  final String title, toggleTitle;
  final MouseCursor onHoverPointer;
  final TextStyle? titleStyle, textStyle, toggleTitleStyle;
  final IconData titleBackIcon;
  final Widget body;
  final bool showToggleButton,
      fitItemsToBottom,
      isCollapsed,
      titleBack,
      showTitle,
      collapseOnBodyTap;
  final List<CollapsibleItem> items;
  final double height,
      minWidth,
      maxWidth,
      borderRadius,
      iconSize,
      customItemOffsetX,
      padding = 10,
      itemPadding,
      topPadding,
      bottomPadding,
      screenPadding,
      customContentPaddingLeft;
  final IconData toggleButtonIcon;
  final Color backgroundColor,
      avatarBackgroundColor,
      selectedIconBox,
      selectedIconColor,
      selectedTextColor,
      unselectedIconColor,
      unselectedTextColor,
      badgeBackgroundColor,
      badgeTextColor;
  final Duration duration;
  final Curve curve;
  final VoidCallback? onTitleTap;
  final List<BoxShadow> sidebarBoxShadow;

  @override
  _CollapsibleSidebarState createState() => _CollapsibleSidebarState();
}

class _CollapsibleSidebarState extends State<CollapsibleSidebar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _widthAnimation;
  late CurvedAnimation _curvedAnimation;
  late double tempWidth;

  var _isCollapsed;
  late double _currWidth,
      _delta,
      _delta1By4,
      _delta3by4,
      _maxOffsetX,
      _maxOffsetY;
  late int _selectedItemIndex;

  @override
  void initState() {
    assert(widget.items.isNotEmpty);

    super.initState();

    tempWidth = widget.maxWidth > 270 ? 270 : widget.maxWidth;
    _currWidth = widget.minWidth;
    _delta = tempWidth - widget.minWidth;
    _delta1By4 = _delta * 0.25;
    _delta3by4 = _delta * 0.75;
    _maxOffsetX = widget.padding * 2 + widget.iconSize;
    _maxOffsetY = widget.itemPadding * 2 + widget.iconSize;

    _selectedItemIndex = 0;
    for (var i = 0; i < widget.items.length; i++) {
      if (widget.items[i].isSelected) break;
      _selectedItemIndex += 1;
    }

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _curvedAnimation = CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    );

    _controller.addListener(() {
      _currWidth = _widthAnimation.value;
      if (_controller.isCompleted) _isCollapsed = _currWidth == widget.minWidth;
      setState(() {});
    });

    _isCollapsed = widget.isCollapsed;
    var endWidth = _isCollapsed ? widget.minWidth : tempWidth;
    _animateTo(endWidth);
  }

  @override
  void didUpdateWidget(covariant CollapsibleSidebar oldWidget) {
    if (widget.isCollapsed != oldWidget.isCollapsed) {
      _listenCollapseChange();
    }
    super.didUpdateWidget(oldWidget);
  }

  /// Allows you to change [widget.isCollapsed] by keeping it bound
  /// to a variable other than click the button
  ///
  /// `example`: change the [widget.isCollapsed] by screen size.
  ///
  /// CollapsibleSidebar(
  ///   ...
  ///   isCollapsed: MediaQuery.of(context).size.width <= 800,
  /// )
  void _listenCollapseChange() {
    _isCollapsed = widget.isCollapsed;
    var endWidth = _isCollapsed ? widget.minWidth : tempWidth;
    _animateTo(endWidth);
  }

  void _animateTo(double endWidth) {
    _widthAnimation = Tween<double>(
      begin: _currWidth,
      end: endWidth,
    ).animate(_curvedAnimation);
    _controller.reset();
    _controller.forward();
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    if (details.primaryDelta != null) {
      if (Directionality.of(context) == TextDirection.ltr) {
        _currWidth += details.primaryDelta!;
      } else {
        _currWidth -= details.primaryDelta!;
      }
      if (_currWidth > tempWidth)
        _currWidth = tempWidth;
      else if (_currWidth < widget.minWidth)
        _currWidth = widget.minWidth;
      else
        setState(() {});
    }
  }

  void _onHorizontalDragEnd(DragEndDetails _) {
    if (_currWidth == tempWidth)
      setState(() => _isCollapsed = false);
    else if (_currWidth == widget.minWidth)
      setState(() => _isCollapsed = true);
    else {
      var threshold = _isCollapsed ? _delta1By4 : _delta3by4;
      var endWidth = _currWidth - widget.minWidth > threshold
          ? tempWidth
          : widget.minWidth;
      _animateTo(endWidth);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget sidebar = Padding(
      padding: EdgeInsets.all(widget.screenPadding),
      child: GestureDetector(
        onHorizontalDragUpdate: _onHorizontalDragUpdate,
        onHorizontalDragEnd: _onHorizontalDragEnd,
        child: CollapsibleContainer(
          height: widget.height,
          width: _currWidth,
          padding: widget.padding,
          borderRadius: widget.borderRadius,
          color: widget.backgroundColor,
          sidebarBoxShadow: widget.sidebarBoxShadow,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.showTitle ? _avatar : const SizedBox(),
              SizedBox(
                height: widget.topPadding,
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  reverse: widget.fitItemsToBottom,
                  child: Stack(
                    children: [
                      CollapsibleItemSelection(
                        height: _maxOffsetY,
                        offsetY: _maxOffsetY * _selectedItemIndex,
                        color: widget.selectedIconBox,
                        duration: widget.duration,
                        curve: widget.curve,
                      ),
                      Column(
                        children: _items,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: widget.bottomPadding,
              ),
              widget.showToggleButton
                  ? Divider(
                      color: widget.unselectedIconColor,
                      indent: 5,
                      endIndent: 5,
                      thickness: 1,
                    )
                  : SizedBox(
                      height: 5,
                    ),
              widget.showToggleButton
                  ? _toggleButton
                  : SizedBox(
                      height: widget.iconSize,
                    ),
            ],
          ),
        ),
      ),
    );

    return _isCollapsed
        ? Stack(
            alignment: Directionality.of(context) == TextDirection.ltr
                ? Alignment.topLeft
                : Alignment.topRight,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: widget.minWidth *
                          (widget.customContentPaddingLeft < 0 ? 1.1 : 1) +
                      (widget.customContentPaddingLeft >= 0
                          ? widget.customContentPaddingLeft
                          : 0),
                ),
                child: widget.body,
              ),
              sidebar,
            ],
          )
        : Stack(
            alignment: Directionality.of(context) == TextDirection.ltr
                ? Alignment.topLeft
                : Alignment.topRight,
            children: [
              widget.collapseOnBodyTap
                  ? GestureDetector(
                      onTap: () {
                        _isCollapsed = true;
                        _animateTo(widget.minWidth);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: widget.minWidth *
                                  (widget.customContentPaddingLeft < 0
                                      ? 1.1
                                      : 1) +
                              (widget.customContentPaddingLeft >= 0
                                  ? widget.customContentPaddingLeft
                                  : 0),
                        ),
                        child: widget.body,
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.only(
                        left: widget.minWidth *
                                (widget.customContentPaddingLeft < 0
                                    ? 1.1
                                    : 1) +
                            (widget.customContentPaddingLeft >= 0
                                ? widget.customContentPaddingLeft
                                : 0),
                      ),
                      child: widget.body,
                    ),
              sidebar,
            ],
          );
  }

  Widget get _avatar {
    return CollapsibleItemWidget(
      onHoverPointer: widget.onHoverPointer,
      padding: widget.itemPadding,
      offsetX:
          widget.customItemOffsetX >= 0 ? widget.customItemOffsetX : _offsetX,
      scale: _fraction,
      leading: widget.titleBack
          ? Icon(
              widget.titleBackIcon,
              size: widget.iconSize,
              color: widget.avatarBackgroundColor,
            )
          : CollapsibleAvatar(
              backgroundColor: widget.avatarBackgroundColor,
              avatarSize: widget.iconSize,
              name: widget.title,
              avatarImg: widget.avatarImg,
              textStyle: _textStyle(widget.backgroundColor, widget.titleStyle),
            ),
      title: widget.title,
      textStyle: _textStyle(widget.unselectedTextColor, widget.titleStyle),
      isCollapsed: _isCollapsed,
      minWidth: widget.minWidth,
      onTap: widget.onTitleTap,
    );
  }

  List<Widget> get _items {
    return List.generate(widget.items.length, (index) {
      var item = widget.items[index];
      var iconColor = widget.unselectedIconColor;
      var textColor = widget.unselectedTextColor;
      if (item.isSelected) {
        iconColor = widget.selectedIconColor;
        textColor = widget.selectedTextColor;
      }
      return CollapsibleItemWidget(
        onHoverPointer: widget.onHoverPointer,
        padding: widget.itemPadding,
        offsetX:
            widget.customItemOffsetX >= 0 ? widget.customItemOffsetX : _offsetX,
        scale: _fraction,
        leading: item.badgeCount != null && item.badgeCount! > 0
            ? Badge.count(
                backgroundColor: widget.badgeBackgroundColor,
                textColor: widget.badgeTextColor,
                count: item.badgeCount!,
                child: Icon(
                  item.icon,
                  size: widget.iconSize,
                  color: iconColor,
                ))
            : item.iconImage != null
                ? CircleAvatar(
                    radius: widget.iconSize / 2,
                    backgroundImage: item.iconImage,
                    backgroundColor: Colors.transparent,
                  )
                : (item.icon != null
                    ? Icon(
                        item.icon,
                        size: widget.iconSize,
                        color: iconColor,
                      )
                    : SizedBox(
                        width: widget.iconSize,
                        height: widget.iconSize,
                      )),
        iconSize: widget.iconSize,
        iconColor: iconColor,
        title: item.text,
        textStyle: _textStyle(textColor, widget.textStyle),
        isCollapsed: _isCollapsed,
        minWidth: widget.minWidth,
        isSelected: item.isSelected,
        parentComponent: true,
        onTap: () {
          if (item.isSelected) return;
          item.onPressed();
          item.isSelected = true;
          widget.items[_selectedItemIndex].isSelected = false;
          setState(() => _selectedItemIndex = index);
        },
        onLongPress: () {
          if (item.onHold != null) {
            item.onHold!();
          }
        },
        subItems: item.subItems,
      );
    });
  }

  Widget get _toggleButton {
    return CollapsibleItemWidget(
      onHoverPointer: widget.onHoverPointer,
      padding: widget.itemPadding,
      offsetX:
          widget.customItemOffsetX >= 0 ? widget.customItemOffsetX : _offsetX,
      scale: _fraction,
      leading: Transform.rotate(
        angle: _currAngle,
        child: Icon(
          widget.toggleButtonIcon,
          size: widget.iconSize,
          color: widget.unselectedIconColor,
        ),
      ),
      title: widget.toggleTitle,
      textStyle:
          _textStyle(widget.unselectedTextColor, widget.toggleTitleStyle),
      isCollapsed: _isCollapsed,
      minWidth: widget.minWidth,
      onTap: () {
        _isCollapsed = !_isCollapsed;
        var endWidth = _isCollapsed ? widget.minWidth : tempWidth;
        _animateTo(endWidth);
      },
    );
  }

  double get _fraction => (_currWidth - widget.minWidth) / _delta;

  double get _currAngle => -math.pi * _fraction;

  double get _offsetX => _maxOffsetX * _fraction;

  TextStyle _textStyle(Color color, TextStyle? style) {
    return style == null
        ? TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: color,
          )
        : style.copyWith(color: color);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
