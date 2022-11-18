class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: 'Learn from yesterday, live for today, hope for tomorrow. The important thing is not to stop questioning', isDone: true ),
      ToDo(id: '02', todoText: 'If you cant explain it simply, you dont understand it well enough.', isDone: true ),
      ToDo(id: '03', todoText: 'Check Emails', ),
    ];
  }
}