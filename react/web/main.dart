import 'dart:html';

import 'package:react/react_client.dart' as react_client;
import 'package:react/react_dom.dart' as react_dom;

import 'interop/react.dart';
import 'components/hello_message.dart';
import 'components/ticker.dart';
import 'components/todo_app.dart';
import 'components/markdown_editor.dart';

void main() {
  ReactDOM.render(
      React.createElement(
        HelloMessage,
        makeJsObject({
          "name": "Taylor",
        }),
        null,
      ),
      querySelector('#output'));

  react_client.setClientConfiguration();
  react_dom.render(Ticker({}), querySelector('#output2'));
  react_dom.render(TodoApp({}), querySelector('#output3'));
  react_dom.render(MarkdownEditor({}), querySelector('#output4'));
}
