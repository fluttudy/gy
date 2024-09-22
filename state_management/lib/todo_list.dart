import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers/todo_provider.dart';
import 'widgets/todo_item.dart';
import 'models/todo.dart';

void main() => runApp(ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
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
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref(WidgetRef의 인스턴스, 상태를 읽거나 쓸 수 있는 참조), watch 메서드로 todoProvider를 구독
    final todos = ref.watch(todoProvider);

    return Scaffold(
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
            : Text('할 일이 없습니다.'),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _showAddTodoDialog(context, ref),
          child: Icon(Icons.add),
          backgroundColor: Color(0xffFFE8AD),
        )
    );
  }

  // To-Do 추가 화면 팝업창
  void _showAddTodoDialog(BuildContext context, WidgetRef ref) {
    final TextEditingController titleController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('할일 추가'),
          content: TextField(
            controller: titleController,
            decoration: InputDecoration(hintText: '새 할 일을 입력하세요.'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                final title = titleController.text;
                if (title.isNotEmpty) {
                  ref.read(todoProvider.notifier).addTodo(title);
                  Navigator.of(context).pop(); // 다이얼로그 닫기
                }
              },
              child: Text('추가'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // 다이얼로그 닫기
              },
              child: Text('취소'),
            ),
          ],
        );
      },
    );
  }
}