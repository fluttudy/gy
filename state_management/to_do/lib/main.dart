import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers/todo_provider.dart';
import 'widgets/todo_item.dart';
import 'utils/popup.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do App',
      locale: Locale('ko', 'KR'),
      home: TodoListScreen(),
    );
  }
}

class TodoListScreen extends ConsumerWidget {
  TodoListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref(WidgetRef의 인스턴스, 상태를 읽거나 쓸 수 있는 참조), watch 메서드로 todoProvider를 구독
    final todos = ref.watch(todoProvider);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xffFFD365),
          title: Text('To do List'),
        ),
        body: todos.isNotEmpty
            ? ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              return TodoItem(todo: todos[index]);
            })
            : Center(child: Text('할 일이 없습니다.')),
        floatingActionButton: FloatingActionButton(
          onPressed: () => showAddTodoDialog(context, ref),
          child: Icon(Icons.add),
          backgroundColor: Color(0xffFFE8AD),
        )
    );
  }
}