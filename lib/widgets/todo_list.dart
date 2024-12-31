import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/utils/color.dart';
import 'package:todo_app/utils/sizer_utils.dart';
import 'package:todo_app/widgets/common_text.dart';
class TodoList extends StatelessWidget {
  final Todo todo;
  final onToDoChanged;
  final onDeleteItem;
  final onEditItem;

  const TodoList({Key? key, required this.todo, this.onToDoChanged, this.onDeleteItem, this.onEditItem}): super(key:key);

  @override


  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: AppColor.colorPrimaryBlue,
        leading: Obx(() => Icon(
          todo.isDone.value ? Icons.check_box : Icons.check_box_outline_blank,
          color: AppColor.black,
        )),
        title: Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonText(
              text: todo.todoText!,
              textDecoration: todo.isDone.value
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
            ),
            if (todo.dueDate != null)
              CommonText(
                text: 'Due: ${DateFormat('yyyy-MM-dd HH:mm').format(todo.dueDate!)}',
                textDecoration: todo.isDone.value
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
          ],
        )),
        trailing: Container(
          height: 35,
          width: 100,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: IconButton(
                  onPressed: () {
                    _displayEditDialog(context, todo);
                  },
                  icon: Icon(Icons.edit),
                  color: AppColor.black,
                  iconSize: 20,
                ),
              ),
              Expanded(
                child: IconButton(
                  onPressed: () {
                    onDeleteItem(todo.id);
                  },
                  icon: Icon(Icons.delete),
                  color: AppColor.black,
                  iconSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _displayEditDialog(BuildContext context, Todo todo) {
    final TextEditingController _textController =
    TextEditingController(text: todo.todoText);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: CommonText(text: 'Edit ToDo',),
          content: TextField(
            controller: _textController,
            decoration: InputDecoration(
              hintText: 'Enter your new ToDo Task',
              hintStyle: TextStyle(color:AppColor.gray,),
              border: InputBorder.none,
            ),
          ),
          actions: [
            TextButton(
              child: Text('Cancel',style: TextStyle(color: AppColor.colorPrimaryBlue),),
              onPressed: () {
                Get.back();
              },
            ),
            TextButton(
              child: Text('Save',style: TextStyle(color: AppColor.colorPrimaryBlue)),
              onPressed: () {
                onEditItem(todo.id!, _textController.text);
                Get.back();
              },
            ),
          ],
        );
      },
    );
  }
}
