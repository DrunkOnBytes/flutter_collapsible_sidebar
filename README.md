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

| Name | Data Type | Default Value | Description |
| :---: | :---: | :---: | :---: |
| `isCollapsed` | bool | true | can set condition to control state of sidebar (collapsed/expanded) on some property change |
| `collapseOnBodyTap` | bool | true | flag to enable/disable tapping on the body of the app (area other than the sidebar) to collapse the sidebar |
| `items` | `List<CollapsibleItems>` | --- | List of `CollapsibleItems` |
| `showTitle` | bool | true | can set to false to hide title and avatar Image |
| `title` | String | --- | Title of the Collapsible Sidebar |
| `titleBack` | bool | false | set to 'true' to use a back icon instead of avatar picture |
| `titleBackIcon` | Icons | Icons.arrow_back | the back icon is 'arrow_back' by default (customizable) |
| `onTitleTap` | Function | --- | custom callback function called when title avatar or back icon is pressed |
| `onHoverPointer` | SystemMouseCursors | SystemMouseCursors.click | the default hover mouse pointer is set to 'click' type by default (customizable) |
| `textStyle` | TextStyle | --- | custom style for sidebar title |
| `titleStyle` | TextStyle | --- | custom style for collapsible items text |
| `toggleTitleStyle` | TextStyle | --- | custom style for toggle button title |
| `avatarImg` | Image | --- | Image to be displayed |
| `body` | Widget | --- | The main body of the app (the underlying main widget other than the sidebar) |
| `height` | double | double.infinity | height of the Sidebar |
| `minWidth` | double | 80 | Width of Sidebar when Collapsed |
| `maxWidth` | double | 270 |  Width of Sidebar when Expanded |
| `borderRadius` | double |15 | Radius of the borders |
| `iconSize` | double | 40 | Size of the icons |
| `toggleTitle` | String | 'Collapse' | title text of Toggle Button |
| `toggleButtonIcon` | Icons | Icons.chevron_right | Icon of the Toggle button |
| `backgroundColor` | Color | Color(0xff2B3138) | The background color |
| `selectedIconBox` | Color | Color(0xff2F4047) | Color of Icon Box when selected |
| `selectedIconColor` | Color | Color(0xff4AC6EA) | Color of Icon when selected |
| `selectedTextColor` | Color | Color(0xffF3F7F7) | Color of text when selected |
| `unselectedIconColor` | Color | Color(0xff6A7886) | Color of Icon when not selected |
| `unselectedTextColor` | Color | Color(0xffC0C7D0) | Color of text when not selected |
| `duration` | Duration | Duration(milliseconds: 500) | Animation duration for collapsed->expanded & vice-versa |
| `curve` | Curves | Curves.fastLinearToSlowEaseIn | Animation curve for collapsed->expanded & vice-versa |
| `screenPadding` | double | 4 | Padding to the screen |
| `topPadding` | double | 0 | space between image avatar and icons |
| `bottomPadding` | double | 0 | space between icons and toggle button |
| `fitItemsToBottom` | bool | true | fit all icons to the end of the space between image avatar and toggle button|
| `showToggleButton` | bool | true | flag to enable/disable showing the toggle button |
| `sidebarBoxShadow` | `List<BoxShadow>` | [BoxShadow(color: Colors.blue, blurRadius: 10, spreadRadius: 0.01, offset: Offset(3, 3),),] | Just like the "BoxDecoration" parameter of a "Container" |

## Contributing
# A big thank you to all the contributors without whom this project would be impossible to maintain and enhance. 👏👏👏

<a href="https://github.com/DrunkOnBytes/flutter_collapsible_sidebar/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=DrunkOnBytes/flutter_collapsible_sidebar&max=100&anon=1" />
</a>


## License

---

Apache 2.0
