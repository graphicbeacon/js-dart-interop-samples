@JS()
library fullpage_interop;

import 'package:js/js.dart';

@JS('fullpage')
class Fullpage {
  external factory Fullpage(String selector, FullpageOptions options);
}

@JS()
@anonymous
class FullpageOptions {
  external factory FullpageOptions({
    bool navigation,
    int responsiveWidth,
    List<String> anchors,
    List<String> sectionsColor,
    bool parallax,
    Function(
      dynamic origin,
      dynamic destination,
      dynamic direction,
    )
        onLeave,
  });
}
