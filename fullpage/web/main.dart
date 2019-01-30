import 'dart:html';

import 'package:fullpage_example/fullpage_interop.dart';

void main() {
  Fullpage(
      '#fullpage',
      FullpageOptions(
          navigation: true,
          responsiveWidth: 700,
          anchors: ['home', 'about-us', 'contact'],
          sectionsColor: ['yellow', 'orange', '#C0C0C0', '#ADD8E6'],
          parallax: true,
          onLeave: (origin, destination, direction) {
            window.console.dir(origin);
            window.console.log(destination);
            window.console.log(direction);
          }));
}
