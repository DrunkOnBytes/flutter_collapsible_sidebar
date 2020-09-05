# collapsible_sidebar
-------------------------------------------------------------

A collapsible sidebar for Flutter apps implementing the Material Design.

<div class="row">
  <div class="col-md-8" markdown="1">
  <img src="https://github.com/RyuuKenshi/flutter_collapsible_sidebar/blob/master/screenshot/collapsible_sidebar.gif" width="250">
  </div>
  <div class="col-md-4" markdown="1">
  
  ## Features 

  * Material Design
  * Pre-built customizable tile widgets (CollapsibleItems)
  * Smooth Animation

  ## Supported platforms

  * Flutter Android
  * Flutter iOS
  * Flutter web
  * Flutter desktop
  
  </div>
</div>


## Live preview

https://ryuukenshi.github.io/collapsible_sidebar

Note: this page is built with flutter-web. For a better user experience, please use a mobile device to open this link.

## Installation

Add `collapsible_sidebar: ^1.0.1` to your `pubspec.yaml` dependencies. And import it:

```dart
import 'package:collapsible_sidebar/collapsible_sidebar.dart';
```

## How to use

Simply create a `CollapsibleSidebar` widget and a list of `CollapsibleItems` suppose `_items`. Finally add the required parameters to `CollapsibleSidebar` and a `body` widget suppose `_body` which will occupy the remaining screen:

```dart
CollapsibleSidebar(
  items: _items,
  avatarImg: _avatarImg,
  title: 'John Smith',
  body: _body,
)
```

## Params

```dart

CollapsibleSidebar(
    items: _items,
    title: 'Lorem Ipsum',
    avatarImg: NetworkImage('https://www.w3schools.com/howto/img_avatar.png'),
    body: _body,
    height: double.infinity,
    minWidth: 80,
    maxWidth: 270,
    borderRadius: 15,
    iconSize: 40,
    textSize: 20,
    toggleButtonIcon: Icons.chevron_right,
    backgroundColor: Color(0xff2B3138),
    selectedIconBox: Color(0xff2F4047),
    selectedIconColor: Color(0xff4AC6EA),
    selectedTextColor: Color(0xffF3F7F7),
    unselectedIconColor: Color(0xff6A7886),
    unselectedTextColor: Color(0xffC0C7D0),
    duration: Duration(milliseconds: 500),
    curve: Curves.fastLinearToSlowEaseIn,
    screenPadding: 4,
    showCollapseButton: true,
)
```

## License
--------------------------------------------------------------

Apache 2.0
