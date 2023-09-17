import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo/constants/enums.dart';
import 'package:todo/constants/styles/text_styles.dart';
import 'package:todo/views/home/controller/home.controller.dart';

import '../../../constants/constants.dart';
import '../../../constants/styles/colors.dart';
import '../../../global/widgets/spaceh.dart';
import '../../todo_detail/view/todo_detail.dart';
import '../widgets/todo_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        Provider.of<HomeController>(context, listen: false).onHomeInit();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(builder: (context, homeControl, _) {
      return Scaffold(

          ///!---------------------------------------(floating action button)
          floatingActionButton: FloatingActionButton(
            backgroundColor: kBlack,
            onPressed: () {
              //?------------------------(when floating action button is tapped)

              //*------------------------(todo status changed to newTodo)
              homeControl.setCurrentTodoStatus(todoStatus: TodoStatus.newTodo);

              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const TodoDetailScreen(
                  title: '',
                  subTitle: '',
                  isCompleted: false,
                  //!---------------(As the user is creating new todo index is set as -1 useful in delete function refactoring)
                  index: -1,
                ),
              ));
            },
            child: const Icon(Icons.add),
          ),
          backgroundColor: kLightGrey,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SpaceH(
                h: 0.07,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 25.w,
                  vertical: 10.h,
                ),

                ///!---------------------------------------( title)
                child: Kstyles().bold30(
                    text: Constants.homeTitle, textAlign: TextAlign.start),
              ),
              Expanded(
                child: homeControl.db.todoList.isEmpty
                    ? Container(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ///!---------------------------------------( text when the data is empty)
                            Kstyles().bold18(text: Constants.homeEmptyText),
                            Icon(
                              Icons.checklist_rounded,
                              size: 50.sp,
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: homeControl.db.todoList.length,

                        //!---------------------------------------(todo list tile )
                        itemBuilder: (context, index) => TodoTile(
                          //*---------------------(todo title)
                          taskTitle: homeControl.db.todoList[index]["title"],
                          //*---------------------(todo subtitle)
                          taskSubTitle: homeControl.db.todoList[index]
                              ["subtitle"],
                          //*---------------------(todo oncomplete status)
                          onComplete: homeControl.db.todoList[index]
                              ["onComplete"],
                          onChanged: (value) {
                            //?------------------------(when checkbox is tapped)
                            homeControl.checkBoxChanged(
                                value: value, index: index);
                          },
                          onTap: () {
                            //?------------------------(when todo tile is tapped)
                            //*------------------------(todo status changed to createdTodo)
                            homeControl.setCurrentTodoStatus(
                                todoStatus: TodoStatus.createdTodo);
                            //*---------------------(navigate to todo detail screen)
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => TodoDetailScreen(
                                title: homeControl.db.todoList[index]["title"],
                                subTitle: homeControl.db.todoList[index]
                                    ["subtitle"],
                                isCompleted: false,
                                index: index,
                              ),
                            ));
                          },
                          onSlide: (context) {
                            //*---------------------(swipe to delete )
                            homeControl.onDeleteTask(index: index);
                          },
                        ),
                      ),
              ),
            ],
          ));
    });
  }
}
