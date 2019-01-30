import 'package:react/react.dart';

class TodoAppComponent extends Component {
  @override
  Map getInitialState() => {'items': <Map<String, dynamic>>[], 'text': ''};

  @override
  render() => div({}, [
        h3({}, 'TODO'),
        TodoList({'items': state['items']}),
        form({
          'onSubmit': handleSubmit
        }, [
          label({
            'htmlFor': 'new-todo',
          }, 'What needs to be done?'),
          input({
            'id': 'new-todo',
            'onChange': handleChange,
            'value': state['text']
          }),
          button({}, 'Add #${state["items"].length + 1}'),
        ])
      ]);

  handleSubmit(SyntheticFormEvent e) {
    e.preventDefault();
    if (state['text'].isEmpty) return;

    var newItem = {
      'id': DateTime.now().millisecondsSinceEpoch,
      'text': state['text']
    };

    var items = state['items']..add(newItem);

    setState({'items': items, 'text': ''});
  }

  handleChange(SyntheticFormEvent e) {
    setState({'text': e.target.value});
  }
}

var TodoApp = registerComponent(() => TodoAppComponent());

class TodoListComponent extends Component {
  @override
  render() => ul(
      {},
      props['items']
          .map((Map todo) => li({'key': todo['id']}, todo['text']))
          .toList());
}

var TodoList = registerComponent(() => TodoListComponent());
