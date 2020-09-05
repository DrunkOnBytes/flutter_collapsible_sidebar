# collapsible_sidebar
-------------------------------------------------------------

A collapsible sidebar for Flutter apps implementing the Material Design.

## Features 

* Material Design
* Pre-built customizable tile widgets (CollapsibleItems)
* Smooth Animation

## Supported platforms

* Flutter Android
* Flutter iOS
* Flutter web
* Flutter desktop

## Live preview

https://serenader2014.github.io/flutter_carousel_slider/#/

Note: this page is built with flutter-web. For a better user experience, please use a mobile device to open this link.

## Installation

Add `collapsible_sidebar: ^1.0.1` to your `pubspec.yaml` dependencies. And import it:

```dart
import 'package:collapsible_sidebar/collapsible_sidebar.dart';
```

## How to use

Simply create a `CollapsibleSidebar` widget and a list of `CollapsibleItems`. Finally add the required parameters to `CollapsibleSidebar` and a `body` widget which will occupy the remaining screen:

```dart
CollapsibleSidebar(
  items: _items,
  avatarImg: _avatarImg,
  title: 'John Smith',
  body: _body(size, context),
)
```

## Params

```dart

CarouselSlider(
   items: items,
   options: CarouselOptions(
      height: 400,
      aspectRatio: 16/9,
      viewportFraction: 0.8,
      initialPage: 0,
      enableInfiniteScroll: true,
      reverse: false,
      autoPlay: true,
      autoPlayInterval: Duration(seconds: 3),
      autoPlayAnimationDuration: Duration(milliseconds: 800),
      autoPlayCurve: Curves.fastOutSlowIn,
      enlargeCenterPage: true,
      onPageChanged: callbackFunction,
      scrollDirection: Axis.horizontal,
   )
 )
```

## Screenshot

Basic text carousel demo:

![simple](screenshot/basic.gif)

Basic image carousel demo:

![image](screenshot/image.gif)

A more complicated image carousel slider demo:

![complicated image](screenshot/complicated-image.gif)

Fullscreen image carousel slider demo:

![fullscreen](screenshot/fullscreen.gif)

Image carousel slider with custom indicator demo:

![indicator](screenshot/indicator.gif)

Custom `CarouselController` and manually control the pageview position demo:

![manual](screenshot/manually.gif)

Vertical carousel slider demo:

![vertical](screenshot/vertical.gif)

Simple on-demand image carousel slider, with image auto prefetch demo:

![prefetch](screenshot/preload.gif)

No infinite scroll demo:

![noloop](screenshot/noloop.gif)

All screenshots above can be found at the example project.

## License

MIT
