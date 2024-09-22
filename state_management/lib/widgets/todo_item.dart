import 'package:flutter/material.dart';
import '../models/todo.dart';
import '../providers/todo_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// provider값이 변경되면 ConsumerWidget으로 재빌드
class TodoItem extends ConsumerWidget {
  final Todo todo;

  TodoItem({required this.todo});

  // 수정 다이얼로그 메서드
  Future<void> _showEditTitleDialog(BuildContext context, WidgetRef ref) async {
    final TextEditingController controller = TextEditingController(text: todo.title);

    return showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('수정하기'),
          content: TextField(
            controller: controller, // 기존 제목을 기본 값으로 설정
            decoration: InputDecoration(hintText: '새 할 일을 입력하세요'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // 다이얼로그 닫기
              },
              child: Text('취소'),
            ),
            TextButton(
              onPressed: () {
                final newTitle = controller.text.trim();
                if (newTitle.isNotEmpty) {
                  ref.read(todoProvider.notifier).updateTodo(todo.id, newTitle);
                }
                Navigator.of(context).pop(); // 다이얼로그 닫기
              },
              child: Text('확인'),
            ),
          ],
        );
      },
    );
  }

  // 삭제 확인 다이얼로그 메서드
  Future<bool?> _showDeleteConfirmationDialog(BuildContext context, WidgetRef ref, Todo todo) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('삭제 확인'),
          content: Text('${todo.title}을(를) 삭제하시겠습니까?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // 다이얼로그 닫기, 삭제 취소
              },
              child: Text('취소'),
            ),
            TextButton(
              onPressed: () {
                ref.read(todoProvider.notifier).deleteTodo(todo.id);
                Navigator.of(context).pop(true); // 다이얼로그 닫기, 삭제 확인
              },
              child: Text('삭제'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dismissible(
      key: Key(todo.id),
      direction: DismissDirection.endToStart, // 스와이프 방향
      confirmDismiss: (direction) async {
        // 삭제 확인 다이얼로그 표시
        final shouldDelete = await _showDeleteConfirmationDialog(context, ref, todo);
        return shouldDelete ?? false; // true를 반환하면 삭제, false면 삭제 취소
      },
      background: Container(
        color: Colors.red, // 스와이프 시 배경색
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon(Icons.delete, color: Colors.white),
            // SizedBox(width: 10),
            Text('삭제', style: TextStyle(color: Colors.white, fontSize: 16)),
          ],
        ),// 삭제 아이콘
      ),
      child: ListTile(
        leading: Checkbox(
          value: todo.isDone,
          onChanged: (value) {
            ref.read(todoProvider.notifier).toggleTodoStatus(todo.id);
          },
          activeColor: Colors.green,
        ),
        title: Text(
          todo.title,
          style: TextStyle(
            decoration: todo.isDone ? TextDecoration.lineThrough : null,
            color: todo.isDone ? Colors.grey : Colors.black,
          ),
        ),
        onLongPress: () {
          _showEditTitleDialog(context, ref);
        },
      ),
    );
  }
}
