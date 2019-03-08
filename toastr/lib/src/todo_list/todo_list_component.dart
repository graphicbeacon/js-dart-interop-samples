import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:toastr/src/interop/toastr.dart';

import 'todo_list_service.dart';

@Component(
  selector: 'todo-list',
  styleUrls: ['todo_list_component.css'],
  templateUrl: 'todo_list_component.html',
  directives: [
    MaterialCheckboxComponent,
    MaterialFabComponent,
    MaterialIconComponent,
    materialInputDirectives,
    NgFor,
    NgIf,
  ],
  providers: [ClassProvider(TodoListService)],
)
class TodoListComponent implements OnInit {
  final TodoListService todoListService;

  List<Todo> items = [];
  String newTodo = '';

  TodoListComponent(this.todoListService);

  @override
  Future<Null> ngOnInit() async {
    items = await todoListService.getTodoList();
  }

  void add() {
    if (items.indexWhere((todo) =>
            todo.text.toLowerCase().trim() == newTodo.toLowerCase().trim()) >
        -1) {
      toastr.error('Cannot enter duplicate task');
      return;
    }
    items.add(Todo(newTodo));
    toastr.clear();
    toastr.info(
        'Added "$newTodo"',
        null,
        mapToJsObject({
          'timeOut': 1000,
          'positionClass': 'toast-bottom-right',
        }));
    newTodo = '';
  }

  void remove(int index) {
    var removedTodo = items.removeAt(index);
    toastr.remove();
    toastr.warning(
        'Removed ${removedTodo.text}',
        'Deleted',
        mapToJsObject({
          'timeOut': 500,
          'positionClass': 'toast-bottom-left',
        }));
  }

  void toggleCheckbox(int index) {
    var toggledTodo = items[index];
    toastr.clear();

    if (toggledTodo.done) {
      toastr.success('Marked "${toggledTodo.text}" as complete', 'Well done!');
    }
  }
}
