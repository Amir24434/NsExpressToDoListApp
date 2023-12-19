class Task {
  String name;
  bool isDone;
  DateTime dueDate;

  Task(this.name, this.isDone, this.dueDate);

  String get formattedDueDate {
    if (dueDate != null) {
      return '${dueDate.day}/${dueDate.month}/${dueDate.year} ${dueDate.hour}:${dueDate.minute}';
    }
    return '';
  }
}
