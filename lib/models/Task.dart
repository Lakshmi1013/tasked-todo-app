class Task {
  String description;
  bool complete;
  int id;
  static const String TABLENAME = 'tasked';

  Task(this.description, {this.complete = false});
}
