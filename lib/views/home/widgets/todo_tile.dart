import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo/constants/styles/colors.dart';
import 'package:todo/global/widgets/spaceh.dart';

import '../../../constants/dimensions/dimensions.dart';
import '../../../constants/styles/text_styles.dart';

class TodoTile extends StatelessWidget {
  final String taskTitle;
  final String taskSubTitle;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? onSlide;
  final Function()? onTap;
  final bool onComplete;
  const TodoTile({
    super.key,
    required this.taskTitle,
    required this.taskSubTitle,
    required this.onChanged,
    required this.onComplete,
    required this.onTap,
    required this.onSlide,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(top: 15.0.w, left: 20.w, right: 20.w),
        child: Slidable(
          endActionPane: ActionPane(motion: const StretchMotion(), children: [
            SlidableAction(
              onPressed: onSlide,
              icon: Icons.delete,
              backgroundColor: kRed,
              borderRadius: kRadius10,
            )
          ]),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 25.w),
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
              borderRadius: kRadius10,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Checkbox.adaptive(
                    activeColor: kBlack,
                    value: onComplete,
                    onChanged: onChanged,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Kstyles().bold20(
                        decoration: onComplete
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        text: taskTitle,
                      ),
                      const SpaceH(h: 0.005),
                      Kstyles().med16(
                          decoration: onComplete
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                          text: taskSubTitle,
                          color: kBlack.withOpacity(0.65)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
