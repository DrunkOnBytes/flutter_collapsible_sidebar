# collapsible_sidebar

---

A collapsible sidebar for Flutter apps implementing the Material Design.

![responsive-ui](https://user-images.githubusercontent.com/37551474/182013560-741723a2-64c3-40e2-9b6c-c640e7fcf1ba.gif)

## 🌟 Version 2.0.3 ✨

---

## Features

- Material Design
- Pre-built customizable tile widgets (CollapsibleItems)
- Smooth Animation

## Supported platforms

- Flutter Android
- Flutter iOS
- Flutter web
- Flutter desktop


- Added support for Null-Safety. (By ⭐[José Luis](https://github.com/SalahAdDin)⭐)
- Added Mouse Region Detection on Web and ability to change Cursor type. (By ⭐[TheLonelyNull](https://github.com/TheLonelyNull)⭐)
- Title Avatar picture can be replaced with custom back icon. (By ⭐[TheLonelyNull](https://github.com/TheLonelyNull)⭐)
- Title Avatar clickable with custom callback function. (By ⭐[TheLonelyNull](https://github.com/TheLonelyNull)⭐)
- Added ability to set Sidebar Collapsed or Expanded according to a condition using the `isCollapsed` parameter. (By ⭐[Taylan YILDIZ](https://github.com/taylanyildiz)⭐)
- Added ability to set custom BoxShadows to the sidebar using the `sidebarBoxShadow` parameter.
- Added ability to hide Title and Avatar Image. (By ⭐[ShaunAtSense](https://github.com/ShaunAtSense)⭐)
- Added ability to Collapse the Sidebar by tapping on body of the app (area other than the sidebar). (By ⭐[partitionce](https://github.com/partitionce)⭐)
- Fixed #26. (By ⭐[Enes Malik Acun](https://github.com/maliksenpai)⭐)

## Live preview

https://drunkonbytes.github.io/flutter_collapsible_sidebar

Note: this page is built with flutter-web. For a better user experience, please use a mobile device to open this link.

## Installation

Add `collapsible_sidebar: ^2.0.3` to your `pubspec.yaml` dependencies. And import it:

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

Also you can use the `isCollapsed` condition depending how you want the state of the sidebar to change (collapsed/expanded)
for example [size.width]

```dart
CollapsibleSidebar(
  isCollapsed: MediaQuery.of(context).size.width <= 800,
  items: _items,
  avatarImg: _avatarImg,
  title: 'John Smith',
  body: _body,
)
```

## Parameters (customizable attributes)

| Name | Default Value | Description |
| :---: | :---: | :---: |
| `isCollapsed` | true  | can set condition to control state of sidebar (collapsed/expanded) on some property change |
| `collapseOnBodyTap` | true  | flag to enable/disable tapping on the body of the app (area other than the sidebar) to collapse the sidebar |

```dart

CollapsibleSidebar(
    isCollapsed: true, //true by default, can set condition to control state of sidebar (collapsed/expanded) on some property change
    collapseOnBodyTap: true, //true by default, flag to enable/disable tapping on the body of the app (area other than the sidebar) to collapse the sidebar
    items: _items,
    showTitle: true, //true by default, can set to false to hide title and avatar Image
    title: 'Lorem Ipsum',
    titleBack: false,  //false by default, set to 'true' to use a back icon instead of avatar picture
    titleBackIcon: Icons.arrow_back, //the back icon is 'arrow_back' by default (customizable)
    onTitleTap: () {  //custom callback function called when title avatar or back icon is pressed
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Yay! Flutter Collapsible Sidebar!')));
    },
    onHoverPointer: SystemMouseCursors.click, //the default hover mouse pointer is set to 'click' type by default (customizable)
    textStyle: TextStyle(fontSize: 20), //custom style for sidebar title
    titleStyle: TextStyle(fontSize: 20), //custom style for collapsible items text
    toggleTitleStyle: TextStyle(fontSize: 20), //custom style for toggle button title
    avatarImg: NetworkImage('https://www.w3schools.com/howto/img_avatar.png'),
    body: _body,
    height: double.infinity,
    minWidth: 80,
    maxWidth: 270,
    borderRadius: 15,
    iconSize: 40,
    toggleTitle: 'Collapse', //title text of Toggle Button
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
    topPadding: 0, //space between image avatar and icons
    bottomPadding: 0, //space between icons and toggle button
    fitItemsToBottom: true, //fit all icons to the end of the space between image avatar and toggle button
    showToggleButton: true,
    sidebarBoxShadow: [BoxShadow(
                            color: Colors.blue,
                            blurRadius: 10,
                            spreadRadius: 0.01,
                            offset: Offset(3, 3),
                          ),],
     //sidebarBoxShadow accepts a list<BoxShadow> just like the "BoxDecoration" parameter of a "Container". By default a black shadow is applied.
)
```

## License

---

Apache 2.0
