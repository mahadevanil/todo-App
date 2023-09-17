import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/constants/constants.dart';
import 'package:todo/views/home/model/todo_list.model.dart';

class TodoDataBase {
  //!---------------------------------(Database )

  List todoList = [];

  //*------------------------------ reference hive box
  Box dataBase = Hive.box(Constants.dbName);

  ///*---------------------------------------- (run this method if this is the first time ever opening this app)
  void createInitialData() {
    todoList = [
      TodoTileModel(
              title: 'Eat Breakfast',
              subtitle: 'eat breakfast before 10 am',
              onComplete: false)
          .toJson(),
      TodoTileModel(
              title: 'Wake up early',
              subtitle: 'Wake up at 6am',
              onComplete: false)
          .toJson(),
    ];
  }

  //*------------------------------------( load the data from database)
  void loadData() {
    todoList = dataBase.get(Constants.dbKey)!.toList();
  }

  //*-----------------------------------(update the database)
  void updateDataBase() {
    dataBase.put(Constants.dbKey, todoList);
  }
}
