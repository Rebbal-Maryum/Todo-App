import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:todo_app/generated/assets.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class HomeController extends GetxController {
    var todoList = <Todo>[].obs;
    var foundToDo = <Todo>[].obs;
    TextEditingController todoController = TextEditingController();

    Rx<DateTime?> selectedDueDate = Rx<DateTime?>(null); // Add this to store the selected date and time

    final FlutterLocalNotificationsPlugin notificationsPlugin=FlutterLocalNotificationsPlugin();
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    @override
    void onInit() {
        super.onInit();
        loadTodosFromFirestore(); // Load existing todos from Firestore
        initNotification();
    }

    void loadTodosFromFirestore() {
        // Set up a listener for Firestore collection changes, ordered by timestamp
        firestore.collection('todos')
            .orderBy('timestamp', descending: true) // Order by timestamp in descending order
            .snapshots()
            .listen((snapshot) {
            todoList.clear(); // Clear current todoList
            for (var doc in snapshot.docs) {
                var data = doc.data() as Map<String, dynamic>;

                // Parse the dueDate from Firestore if it's available
                DateTime? dueDate;
                if (data['dueDate'] != null) {
                    dueDate = (data['dueDate'] as Timestamp).toDate();
                }

                todoList.add(Todo(
                    id: doc.id, // Use Firestore document ID as the todo ID
                    todoText: data['todoText'],
                    isDone: data['isDone'] ?? false, // Default to false if not set
                    dueDate: dueDate, // Assign the parsed dueDate
                ));
            }
            foundToDo.assignAll(todoList); // Update foundToDo with fetched results
        });
    }

    void handleTodoChange(Todo todo) {
        todo.isDone.value = !todo.isDone.value;

        // Update the Firestore document
        firestore.collection('todos').doc(todo.id).update({
            'isDone': todo.isDone.value,
        });
    }
    void deleteToDoItem(String id) async {
        // Remove from Firestore
        await firestore.collection('todos').doc(id).delete();
    }

    void editToDoItem(String id, String newText) async {
        // Update the Firestore document
        await firestore.collection('todos').doc(id).update({
            'todoText': newText,
        });
    }

    void addToDoItem(String toDo, DateTime? dueDate) async {
        DocumentReference docRef = await firestore.collection('todos').add({
            'todoText': toDo,
            'isDone': false,
            'dueDate': dueDate, // Add dueDate to Firestore
            'timestamp': FieldValue.serverTimestamp(),
        });

        todoController.clear();
    }

    void filter(String enteredkey) {
        List<Todo> results = [];
        if (enteredkey.isEmpty) {
            results = todoList.toList();
        } else {
            results = todoList.where((item) =>
                item.todoText!.toLowerCase().contains(enteredkey.toLowerCase())).toList();
        }
        foundToDo.assignAll(results); // Update foundToDo with filtered results
    }
    Future<void> initNotification() async{
        AndroidInitializationSettings initializationSettingsAndroid=const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings=InitializationSettings(
        android: initializationSettingsAndroid
    );
    await notificationsPlugin.initialize(initializationSettings,onDidReceiveNotificationResponse:(
    NotificationResponse notificationResponse)async{});
    }
    notificationDetails(){
        return const NotificationDetails(
          android: AndroidNotificationDetails('channelId', 'channelName',
          importance: Importance.max,
          icon: '@mipmap/ic_launcher',
          priority: Priority.high,
          playSound: true,
          enableLights: true,
          enableVibration: true,
          visibility: NotificationVisibility.public),
        );
    }
    Future showNotification({int id=0, String? title, String? body, String? payLoad})async{
      return notificationsPlugin.show(id, title, body,await notificationDetails());
    }


}


