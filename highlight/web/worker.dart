import 'dart:html';

import 'package:js/js_util.dart';
import 'package:highlight/highlight.dart';

void main() {
  DedicatedWorkerGlobalScope dws = DedicatedWorkerGlobalScope.instance;

  print('Worker running.');

  dws.importScripts('https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.15.6/highlight.min.js');

  HighlightInterface hljs = getProperty(dws.self, 'hljs');

  dws.onMessage.listen((MessageEvent evt) {
    HighlightAutoInterface result = hljs.highlightAuto(evt.data);
    dws.postMessage(result.value);
  });
}