import 'package:react/react.dart';

import '../interop/remarkable.dart';

class MarkdownEditorComponent extends Component {
  @override
  Map getInitialState() => {'value': 'Hello, **world**!'};

  @override
  render() => div({
        'className': 'MarkdownEditor'
      }, [
        h3({}, 'Input'),
        label({'htmlFor': 'markdown-content'}, 'Enter some markdown'),
        br({}),
        textarea({
          'id': 'markdown-content',
          'onChange': handleChange,
          'defaultValue': state['value'],
        }),
        h3({}, 'Output'),
        div({'className': 'content', 'dangerouslySetInnerHTML': getRawMarkup()})
      ]);

  handleChange(SyntheticFormEvent e) {
    setState({'value': e.target.value});
  }

  getRawMarkup() {
    var md = Remarkable();
    return {
      '__html': md.render(state['value']),
    };
  }
}

var MarkdownEditor = registerComponent(() => MarkdownEditorComponent());
