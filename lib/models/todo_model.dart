// class Todo {
// String? id;
// String? todoText;
// bool isDone;
// Todo({
//   required this.id,
//   required this.todoText,
//   this.isDone=false,
// });
// static List<Todo> todoList(){
//   return[
// Todo(id: '01', todoText: 'Morning', isDone:true),
//   ];
// }
// }
import 'package:get/get.dart';

// class Todo {
//   String? id;
//   String? todoText;
//   RxBool isDone;
//
//   // Constructor with reactive isDone
//   Todo({
//     required this.id,
//     required this.todoText,
//     bool isDone = false,
//   }) : isDone = isDone.obs; // Make isDone reactive
//
//   // Static method to generate a list of todos
//   static List<Todo> todoList() {
//     return [
//
//       // Add more todos here as needed
//     ];
//   }
// }

class Todo {
  String? id;
  String? todoText;
  RxBool isDone;
  DateTime? dueDate; // Add this field

  Todo({
    required this.id,
    required this.todoText,
    bool isDone = false,
    this.dueDate, // Initialize dueDate
  }) : isDone = isDone.obs;
  static List<Todo> todoList() {
    return [

      // Add more todos here as needed
    ];
  }
}


