
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/routes/app_routes.dart';
import 'package:todo_app/ui/home/home_logic.dart';

import 'package:todo_app/ui/social_login_screen/social_login_logic.dart';
import 'package:todo_app/utils/color.dart';
import 'package:todo_app/utils/constant.dart';
import 'package:todo_app/utils/sizer_utils.dart';
import 'package:todo_app/widgets/common_button.dart';
import 'package:todo_app/widgets/todo_list.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final todoList = Todo.todoList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.colorPrimary,
      appBar: AppBar(
        title: Text(
          'My ToDos',
          style: TextStyle(
            color: AppColor.black,
            fontFamily: Constant.fontFamilyNunitoSans,
            fontWeight: FontWeight.w600,
            fontSize: AppFontSize.size_18,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              String nextRoute = AppRoutes.signOut;
              Get.offAllNamed(nextRoute);
            },
            icon: Icon(Icons.settings),
            color: AppColor.black,
          )
        ],
        centerTitle: true,
        backgroundColor: AppColor.colorPrimary,
      ),
      body: GetBuilder<HomeController>(
        id: Constant.idHome,
        builder: (logic) {
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPaddings.padding_20),
                child: Column(
                  children: [
                    searchBox(logic),
                    SizedBox(height: 30),
                    Expanded(
                      child: Obx(() => ListView(
                        children: [
                          for (Todo todoo in logic.foundToDo)
                            TodoList(
                              todo: todoo,
                              onToDoChanged: logic.handleTodoChange,
                              onDeleteItem: logic.deleteToDoItem,
                              onEditItem: logic.editToDoItem,
                            ),
                        ],
                      )),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(
                          bottom: 20,
                          left: 20,
                          right: 10,
                        ),
                        padding: EdgeInsets.symmetric(horizontal: AppPaddings.padding_20),
                        decoration: BoxDecoration(
                          color: AppColor.colorPrimary,
                          boxShadow: [
                            BoxShadow(
                              color: Get.theme.colorScheme.primary.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: TextField(
                          controller: logic.todoController,
                          decoration: InputDecoration(
                            hintText: 'Enter your ToDo Task',
                            hintStyle: TextStyle(color: AppColor.gray),
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              icon: Icon(Icons.calendar_today, color: AppColor.gray),
                              onPressed: () {
                                _pickDueDate(context, logic); // Calls _pickDueDate when the calendar icon is tapped
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        bottom: 20,
                        right: 20,
                      ),
                      width: 60,
                      height: 50,
                      child: CommonButton(
                        onTap: () {
                          // Check if both task and due date are selected before adding
                          if (logic.todoController.text.isEmpty) {
                            Get.snackbar(
                              'Error',
                              'Task field cannot be empty!',
                              backgroundColor: AppColor.grayLight,
                              colorText: AppColor.black,
                            );
                          } else if (logic.selectedDueDate.value == null) {
                            Get.snackbar(
                              'Error',
                              'Please select a due date!',
                              backgroundColor: AppColor.grayLight,
                              colorText: AppColor.black,
                            );
                          } else {
                            // Add task only when both task and date are provided
                            logic.addToDoItem(logic.todoController.text, logic.selectedDueDate.value);
                            logic.showNotification(
                              title: 'ToDo Added',
                              body: 'Your ToDo task "${logic.todoController.text}" has been added!',
                            );
                          }
                        },
                        text: '+',
                        fontSize: 30,
                      ),
                    ),

                    // Container(
                    //   margin: EdgeInsets.only(
                    //     bottom: 20,
                    //     right: 20,
                    //   ),
                    //   width: 60,
                    //   height: 50,
                    //   child: CommonButton(
                    //     onTap: () {
                    //       // Add task only when '+' is pressed and trigger notification
                    //       logic.addToDoItem(logic.todoController.text, logic.selectedDueDate.value);
                    //       logic.showNotification(
                    //         title: 'ToDo Added',
                    //         body: 'Your ToDo task "${logic.todoController.text}" has been added!',
                    //       );
                    //     },
                    //     text: '+',
                    //     fontSize: 30,
                    //   ),
                    // ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }

  Widget searchBox(HomeController logic) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppPaddings.padding_20),
      decoration: BoxDecoration(
        color: AppColor.colorPrimary,
        boxShadow: [
          BoxShadow(
            color: Get.theme.colorScheme.primary.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextField(
        onChanged: (value) => logic.filter(value),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search_outlined,
            color: AppColor.gray,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            maxWidth: 20,
          ),
          border: InputBorder.none,
          hintText: 'Search your ToDo Task',
          hintStyle: TextStyle(color: AppColor.gray),
        ),
      ),
    );
  }
  void _pickDueDate(BuildContext context, HomeController logic) async {
    // Set custom color for DatePicker and TimePicker
    final ThemeData datePickerTheme = Theme.of(context).copyWith(
      colorScheme: ColorScheme.light(
        primary: AppColor.colorPrimaryBlue,
        onPrimary: Colors.white,
        onSurface: AppColor.colorPrimaryBlue,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColor.colorPrimaryBlue,
        ),
      ),
    );

    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: datePickerTheme,
          child: child!,
        );
      },
    );

    if (selectedDate != null) {
      TimeOfDay? selectedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: AppColor.colorPrimaryBlue,
                onPrimary: Colors.white,
                onSurface: AppColor.colorPrimaryBlue,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: AppColor.colorPrimaryBlue,
                ),
              ),
            ),
            child: child!,
          );
        },
      );

      if (selectedTime != null) {
        final selectedDateTime = DateTime(
          selectedDate.year,
          selectedDate.month,
          selectedDate.day,
          selectedTime.hour,
          selectedTime.minute,
        );

        // Format the selectedDateTime to exclude seconds and milliseconds
        String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDateTime);
        String formattedTime = DateFormat('HH:mm').format(selectedDateTime); // Only hours and minutes

        // Use the formatted date and time
        logic.selectedDueDate.value = selectedDateTime;
        // logic.addToDoItem(logic.todoController.text, selectedDateTime); // Pass the formatted DateTime
      }
    }
  }
}

