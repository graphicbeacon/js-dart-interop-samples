import 'dart:html';
import 'dart:async';
import 'dart:js';

import 'app.dart';
import 'todo.dart';

void main() {
  querySelector('[vue-cloak]').attributes.remove('vue-cloak');

  // App 1 example
  Vue(VueOptions(
    el: '#app',
    data: VueDataOptions(message: 'Hello Vue!'),
  ));

  // App 2 example
  Vue(VueOptions(
    el: '#app-2',
    data: VueDataOptions(
      message: 'You loaded this page on ${DateTime(2018).toLocal()}',
    ),
  ));

  // App 3 example
  var app3 = Vue(VueOptions(
    el: '#app-3',
    data: VueDataOptions(seen: true),
  ));

  Future.delayed(Duration(seconds: 2)).then((_) {
    app3.seen = false;
  });

  // App 4 example
  var app4 = Vue(VueOptions(
      el: '#app-4',
      data: VueDataOptions(todos: [
        Todo(text: 'Learn Dart'),
        Todo(text: 'Learn Vue'),
        Todo(text: 'Build something awesome'),
      ])));

  Future.delayed(Duration(seconds: 2)).then((_) {
    app4.todos.add(Todo(text: 'New item'));
  });

  // App 5 example
  Vue(VueOptions(
      el: '#app-5',
      data: VueDataOptions(message: 'Hello Vue.js!'),
      methods:
          VueMethodOptions(reverseMessage: allowInteropCaptureThis((Vue vue) {
        vue.message = vue.message.split('').reversed.toList().join('');
      }))));

  // App 6 example
  Vue(VueOptions(
      el: '#app-6',
      data: VueDataOptions(
        message: 'Hello Vue!',
      )));

  // App 7 example
  Vue.component(
    'todo-item',
    VueComponentOptions(
      template: '<li>{{ todo.text }}</li>',
      props: ['todo'],
    ),
  );
  Vue(VueOptions(
      el: '#app-7',
      data: VueDataOptions(groceryList: [
        Todo(id: 0, text: 'Vegetables'),
        Todo(id: 1, text: 'Cheese'),
        Todo(id: 2, text: 'Whatever else humans are supposed to eat'),
      ])));
}
