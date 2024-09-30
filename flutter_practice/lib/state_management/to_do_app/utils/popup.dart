import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/todo_provider.dart';

// 할일 추가 팝업창 메서드
void showAddTodoDialog(BuildContext context, WidgetRef ref) {
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