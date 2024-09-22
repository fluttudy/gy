class Todo {
  // 속성
  final String id;
  final String title;
  final bool isDone;

  // 생성자
  Todo({required this.id, required this.title, this.isDone = false});

  // 내용수정 메서드 modifiedWith
  Todo modifiedWith({
    String? title,
    bool? isDone,
  }) {
    return Todo(
      id: this.id, // id는 변경하지 않음
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
    );
  }
}
