import 'package:flutter/material.dart';
import 'package:todo/constants/enums.dart';
import 'package:todo/constants/styles/text_styles.dart';

class Constants {
  //!<<<<<<<<<<<<<<<<<<<<<<<<<<<<< DB constants >>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  //*---------------------------------------------------------(DB name)
  static const String dbName = 'TODO APP';
  //*---------------------------------------------------------(DB key)
  static const String dbKey = 'TODOLIST';
  //*-------------------------------------------(homepage title)
  static const String homeTitle = 'My task';
  static const String homeEmptyText = "Create a new task ";
}
//*-----------------------------------------(todo button )

Widget todoButton({
  required TodoStatus type,
  required Widget addButton,
  required Widget editButton,
  required Widget saveButton,
}) {
  switch (type) {
    //*-------------------------(if type is newTodo then add button will be shown)
    case TodoStatus.newTodo:
      return addButton;
    //*-------------------------(if type is createdTodo then edit button will be shown)
    case TodoStatus.createdTodo:
      return editButton;
    //*-------------------------(if type is editTodo then save button will be shown)
    case TodoStatus.editTodo:
      return saveButton;
    default:
      return const SizedBox();
  }
}

Widget todoText({
  required TodoStatus type,
}) {
  switch (type) {
    //*-------------------------(if type is newTodo )
    case TodoStatus.newTodo:
      return Kstyles().med16(text: "Create new Task !!!");
    //*-------------------------(if type is createdTodo )
    case TodoStatus.createdTodo:
      return Kstyles().med16(text: "Please click edit button to change !!!");
    //*-------------------------(if type is editTodo )
    case TodoStatus.editTodo:
      return Kstyles().med16(text: "Don't forget to save !!!");

    default:
      return const SizedBox();
  }
}
