@JS()
library toastr_interop;

import 'package:js/js.dart';
import 'package:js/js_util.dart';

@JS()
external ToastrInterface get toastr;

@JS()
class ToastrInterface {
  external ToastrNotificationFn get info;
  external ToastrNotificationFn get success;
  external ToastrNotificationFn get error;
  external ToastrNotificationFn get warning;
  external Function get remove;
  external Function get clear;
}

typedef ToastrNotificationFn = Function(String message,
    [String title, dynamic options]);

Object mapToJsObject(Map<String, dynamic> dartMap) {
  var jsObject = newObject();

  dartMap.forEach((name, value) {
    setProperty(jsObject, name, value);
  });

  return jsObject;
}
