@JS()
library vue_interop;

import 'package:js/js.dart';
import 'todo.dart';

@JS()
class Vue {
  external factory Vue(VueOptions options);
  external void set seen(bool seen);
  external List<Todo> get todos;
  external String get message;
  external void set message(String message);
  static VueComponent component;
}

@JS()
@anonymous
class VueOptions {
  external factory VueOptions({
    String el,
    VueDataOptions data,
    VueMethodOptions methods,
  });
  external String get el;
  external VueDataOptions get data;
  external VueMethodOptions get methods;
}

@JS()
@anonymous
class VueDataOptions {
  external factory VueDataOptions({
    String message,
    bool seen,
    List<Todo> todos,
    List<Todo> groceryList,
  });
  external String get message;
  external bool get seen;
  external List<Todo> get todos;
  external List<Todo> get groceryList;
}

@JS()
@anonymous
class VueMethodOptions {
  external factory VueMethodOptions({Function reverseMessage});
  external Function get reverseMessage;
}

typedef VueComponent = void Function(
  String componentName,
  VueComponentOptions options,
);

@JS()
@anonymous
class VueComponentOptions {
  external VueComponentOptions({String template, List<String> props});
  external String get template;
  external List<String> get props;
}
