@JS()
library react_interop;

import 'dart:html';
import 'dart:async';
import 'package:js/js.dart';
import 'package:js/js_util.dart';

@JS()
external ReactInterface get React;

@JS()
external ReactDomInterface get ReactDOM;

@JS()
@anonymous
class ReactInterface {
  external CreateElementFn get createElement;
}

typedef CreateElementFn = Function(
  dynamic name,
  Object attrs,
  List children,
);

@JS()
@anonymous
class ReactDomInterface {
  external DomRenderFn get render;
}

typedef DomRenderFn = Function(
  dynamic element,
  Element context,
);

Object makeJsObject(Map dartMap) {
  var jsObject = newObject();

  for (var key in dartMap.keys) {
    setProperty(jsObject, key, dartMap[key]);
  }

  return jsObject;
}

@JS('createReactClass')
external _createReactClass(obj);

createReactClass({
  Function getDefaultProps,
  Function getInitialState,
  Function componentDidMount,
  Function componentWillUnmount,
  Function render,
  Map<String, Function> methodMap,
}) {
  var config = {};

  if (getDefaultProps != null) {
    config['getDefaultProps'] = getDefaultProps;
  }
  if (getInitialState != null) {
    config['getInitialState'] = getInitialState;
  }
  if (componentDidMount != null) {
    config['componentDidMount'] = allowInteropCaptureThis(componentDidMount);
  }
  if (componentWillUnmount != null) {
    config['componentWillUnmount'] =
        allowInteropCaptureThis(componentWillUnmount);
  }
  if (render != null) {
    config['render'] = allowInteropCaptureThis(render);
  }
  if (methodMap != null) {
    methodMap.updateAll((_, fn) => allowInteropCaptureThis(fn));
    config.addAll(methodMap);
  }
  return _createReactClass(makeJsObject(config));
}

class ReactClassInterface {
  external get props;
  external dynamic get state;
  external Function get tick;
  external setStateFn get setState;
  external Timer get interval;
  external void set interval(Timer timer);
}

typedef setStateFn(dynamic state);
