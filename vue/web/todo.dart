@JS()
library todo;

import 'package:js/js.dart';

@JS()
@anonymous
class Todo {
  external factory Todo({int id, String text});
  external String get text;
  external int get id;
}
