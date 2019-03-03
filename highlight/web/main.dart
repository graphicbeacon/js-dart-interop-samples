import 'dart:html';

import 'package:highlight/highlight.dart';

void main() {
  querySelectorAll('#output pre code').forEach((block) {
    hljs.highlightBlock(block);
  });

  hljs.configure(HlConfigOptions(useBr: true));
  hljs.highlightBlock(querySelector('div.code'));

  var code = querySelector('pre code.from-worker');
  Worker w = Worker('worker.dart.js');
  w.onMessage.listen((MessageEvent evt) {
    code.innerHtml = evt.data;
  });
  w.postMessage(code.text);
}
