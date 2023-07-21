import 'package:uuid/uuid.dart';

class Task {
  final String id;
  final String name;
  final DateTime CreatedAt;
  final bool isCompleted;

  Task({required this.id, required this.name, required this.CreatedAt,required this.isCompleted});

  factory Task.olustur({required String name, required DateTime CreatedAt}){
    return Task(id: Uuid().v1(), name: name, CreatedAt: CreatedAt, isCompleted: false);
  }
}