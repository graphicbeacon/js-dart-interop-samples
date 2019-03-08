import 'dart:async';

import 'package:angular/core.dart';

/// Mock service emulating access to a to-do list stored on a server.
@Injectable()
class TodoListService {
  List<Todo> mockTodoList = <Todo>[
    Todo('Grab lunch'),
    Todo('Prep for Bible studies'),
    Todo('Finish video tutorial'),
  ];

  Future<List<Todo>> getTodoList() async => mockTodoList;
}

class Todo {
  Todo(this.text, [this.done = false]);

  String text;
  bool done;
}
