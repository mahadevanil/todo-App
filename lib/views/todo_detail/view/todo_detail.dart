import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo/constants/dimensions/dimensions.dart';
import 'package:todo/constants/enums.dart';
import 'package:todo/constants/styles/colors.dart';
import 'package:todo/global/widgets/spaceh.dart';
import 'package:todo/views/home/controller/home.controller.dart';

import '../../../constants/constants.dart';
import '../../../global/widgets/custom_button.dart';
import '../widget/custom_text_field.dart';

class TodoDetailScreen extends StatefulWidget {
  final String title;
  final String subTitle;
  final bool isCompleted;
  final int index;
  const TodoDetailScreen(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.isCompleted,
      required this.index});

  @override
  State<TodoDetailScreen> createState() => _TodoDetailScreenState();
}

class _TodoDetailScreenState extends State<TodoDetailScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        Provider.of<HomeController>(context, listen: false)
            .onInit(title: widget.title, subTitle: widget.subTitle);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(builder: (context, homeControl, _) {
      return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: kBlack,
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: kLightGrey,
          elevation: 0,
        ),
        backgroundColor: kLightGrey,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SpaceH(
              h: 0.025,
            ),
            Expanded(
              flex: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 25.w,
                  vertical: 1.h,
                ),
                child: todoText(
                  type: homeControl.currentTodoStatus,
                ),
              ),
            ),
            Expanded(
              flex: 0,
              child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 25.w,
                    vertical: 10.h,
                  ),

                  ///!---------------------------------------(my task title)
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(1, 2),
                          spreadRadius: 0,
                          blurRadius: 2,
                          color: Color.fromRGBO(183, 183, 183, 1),
                        )
                      ],
                      color: kWhite,
                      borderRadius: kRadius15,
                    ),
                    child: CustomTextField(
                      controller: homeControl.titleCtrl,
                      minLines: 2,
                      hintText: 'Enter the title',
                      focusNode: homeControl.titleFocus,
                      contentPadding: const EdgeInsets.all(10),
                      alignLabelWithHint: true,
                      maxLines: 3,
                      readOnly: homeControl.currentTodoStatus ==
                                  TodoStatus.editTodo ||
                              homeControl.currentTodoStatus ==
                                  TodoStatus.newTodo
                          ? false
                          : true,
                    ),
                  )),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 25.w,
                    vertical: 10.h,
                  ),

                  ///!---------------------------------------(my task subtitle)
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(1, 2),
                          spreadRadius: 0,
                          blurRadius: 2,
                          color: Color.fromRGBO(183, 183, 183, 1),
                        )
                      ],
                      color: kWhite,
                      borderRadius: kRadius15,
                    ),
                    child: CustomTextField(
                      readOnly: homeControl.currentTodoStatus ==
                                  TodoStatus.editTodo ||
                              homeControl.currentTodoStatus ==
                                  TodoStatus.newTodo
                          ? false
                          : true,
                      controller: homeControl.subTitleCtrl,
                      minLines: 5,
                      hintText: 'Write description',
                      focusNode: homeControl.subTitleFocus,
                      contentPadding: const EdgeInsets.all(10),
                      alignLabelWithHint: true,
                      maxLines: 30,
                    ),
                  )),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 25.w,
                    vertical: 10.h,
                  ),

                  ///!---------------------------------------(my task subtitle)
                  child: Row(
                    children: [
                      Expanded(
                        child: todoButton(
                          addButton: CustomButton(
                            text: 'Add',
                            onPressed: () {
                              homeControl.createTask();
                            },
                            buttonColor: kBlack,
                          ),
                          editButton: CustomButton(
                            text: 'Edit',
                            onPressed: () {
                              //*------------------------(todo status changed to editTodo)
                              homeControl.setCurrentTodoStatus(
                                  todoStatus: TodoStatus.editTodo);
                              homeControl.titleFocus.requestFocus();
                            },
                            buttonColor: kBlack,
                          ),
                          type: homeControl.currentTodoStatus,
                          saveButton: CustomButton(
                            text: 'Save',
                            onPressed: () {
                              homeControl.onSaveUpdate(index: widget.index);
                            },
                            buttonColor: kBlack,
                          ),
                        ),
                      ),
                      Expanded(
                        child: homeControl.currentTodoStatus !=
                                    TodoStatus.newTodo &&
                                homeControl.currentTodoStatus !=
                                    TodoStatus.editTodo
                            ? CustomButton(
                                text: 'Delete',
                                onPressed: () {
                                  homeControl.onDeleteTask(index: widget.index);
                                  Navigator.of(context).pop();
                                },
                                buttonColor: kRed,
                              )
                            : CustomButton(
                                text: 'Cancel',
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                buttonColor: kRed,
                              ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      );
    });
  }
}
