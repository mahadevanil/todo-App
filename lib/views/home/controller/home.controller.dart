import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo/constants/enums.dart';
import 'package:todo/data/todo_database.dart';
import 'package:todo/main.dart';
import 'package:todo/views/home/model/todo_list.model.dart';

import '../../../constants/constants.dart';

class HomeController with ChangeNotifier {
  ///*----------------------- it control the title textfield controller
  TextEditingController titleCtrl = TextEditingController();

  ///*----------------------- it control the subtitle textfield controller
  TextEditingController subTitleCtrl = TextEditingController();

  ///*----------------------- it control the title textfield FocusNode
  FocusNode titleFocus = FocusNode();

  ///*----------------------- it control the subtitle textfield FocusNode
  FocusNode subTitleFocus = FocusNode();

  ///*----------------------- Instance of Todo database
  TodoDataBase db = TodoDataBase();

  //?--------------------------------------(method for checkbox tap)
  checkBoxChanged({bool? value, required int index}) {
    //*----------( checkbox status will be get inverted)
    db.todoList[index]["onComplete"] = !db.todoList[index]["onComplete"];
    log(db.todoList.toString(), name: "task completed");
    //!---------------------(updating to database)
    db.updateDataBase();
    notifyListeners();
  }

//?----------------------------------------(method for creating new task)
  createTask() {
    db.todoList.add(TodoTileModel(
      title: titleCtrl.text,
      subtitle: subTitleCtrl.text,
      onComplete: false,
    ).toJson());
    log(db.todoList.toString(), name: "task created");
    //!---------------------(updating to database)
    db.updateDataBase();
    Navigator.of(navigationKey.currentContext!).pop();
    setCurrentTodoStatus(todoStatus: TodoStatus.createdTodo);
    notifyListeners();
  }

//?----------------------------------------(method for updating existing task)
  onSaveUpdate({required int index}) {
    //*----------( checkbox status will be get inverted)
    db.todoList[index]["title"] = titleCtrl.text;
    db.todoList[index]["subtitle"] = subTitleCtrl.text;
    log(db.todoList.toString(), name: "task updated");
    //!---------------------(updating to database)
    db.updateDataBase();
    setCurrentTodoStatus(todoStatus: TodoStatus.updateTodo);
    Navigator.of(navigationKey.currentContext!).pop();
    notifyListeners();
  }

  //?---------------------------------------(method for deleting existing task)
  onDeleteTask({required int index}) {
    if (index != -1) {
      db.todoList.removeAt(index);
      //!---------------------(updating to database)
      db.updateDataBase();
    }
    notifyListeners();
  }

  TodoStatus currentTodoStatus = TodoStatus.newTodo;
//Todo<<<<<<<<<<<<<<<<<<<<<<<<<<  >>>>>>>>>>>>>>>>>>>>>>>>
//?<<<<<<<<<<<<<<<<<<<<<<<<<< Todo status >>>>>>>>>>>>>>>>>>>>>>>>
//Todo<<<<<<<<<<<<<<<<<<<<<<<<<<  >>>>>>>>>>>>>>>>>>>>>>>>
//!--------------------------------------------------------------------
//* if the user is creating a new todo status will be TodoStatus.new
//!--------------------------------------------------------------------
//* if the user is create todo then status will be TodoStatus.created
//!--------------------------------------------------------------------
//* if the user is editing todo then status will be TodoStatus.edit
//!--------------------------------------------------------------------
//* if the user is saving todo then status will be TodoStatus.update

//?---------------------------------------(method for setting todo status)
  setCurrentTodoStatus({required TodoStatus todoStatus}) {
    currentTodoStatus = todoStatus;
    notifyListeners();
  }

  //!---Method_calling_inItState of todo detail

  onInit({required String title, required String subTitle}) {
    titleCtrl.clear();
    subTitleCtrl.clear();
    titleCtrl.text = title;
    subTitleCtrl.text = subTitle;
    if (currentTodoStatus == TodoStatus.newTodo) {
      titleFocus.requestFocus();
    }
    notifyListeners();
  }

  //!---------Method calling initState of home_screen
  onHomeInit() {
    //?---------- if this is the first time ever opening the app, then create default data
    if (db.dataBase.get(Constants.dbKey) == null) {
      //!---------------------(creating initial data database)
      db.createInitialData();
    } else {
//?------------------ if there already exists data
      //!---------------------(fetching data from database)
      db.loadData();
    }
    notifyListeners();
  }
}
