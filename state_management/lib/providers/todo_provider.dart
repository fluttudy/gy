import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/todo.dart';

// state notifier 작성
// 상태를 가지고 있으며, 상태를 업데이트하는 메서드 제공. 상태를 관리.
class TodoNotifier extends StateNotifier<List<Todo>> {
  // 부모클래스의 생성자를 호출하여 초기 상태 설정
  TodoNotifier() : super([]);

  void addTodo(String title) {
    final newTodo = Todo(
      id: DateTime.now().toString(),
      title: title,
    );

    // 기존 state를 복사 후 새로운 todo 추가한 리스트를 state에 할당
    state = [...state, newTodo];
  }

  void updateTodo(String id, String title) {
    state = [
      for (final todo in state)
        if (todo.id == id) todo.modifiedWith(title: title) else todo,
    ];
  }

  void toggleTodoStatus(String id) {
    state = [
      for (final todo in state)
        if (todo.id == id) todo.modifiedWith(isDone: !todo.isDone) else todo,
    ];
  }

  void deleteTodo(String id) {
    state = state.where((todo) => todo.id != id).toList();
  }
}

// state notifer provider 작성
// 상태를 관리하고 그 상태를 UI에 연결하는 역할. 상태를 제공.
final todoProvider = StateNotifierProvider<TodoNotifier, List<Todo>>((ref) {
  return TodoNotifier();
});