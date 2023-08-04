
import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/screens/colors.dart';
import 'package:sizer/sizer.dart';
void buildTaskDetailsBottomSheet(BuildContext context, ) {
  final theme = Theme.of(context);
  showModalBottomSheet<void>(
    backgroundColor: GameColors.kBackground,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    elevation: 0,
    isScrollControlled: true,
    // Enable scroll control for dynamic height
    context: context,
    builder: (context) {
      return Container(
        height: 50.h,
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
             "Task Details",
              style: theme.textTheme.displayMedium!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("DateFormat('hh:mm a').format(task.from)",
                    style: theme.textTheme.labelLarge!.copyWith(
                      fontSize: 10.sp,
                    )),
                SizedBox(width: 1.h),
                Text("DateFormat('hh:mm a').format(task.to)",
                    style: theme.textTheme.labelLarge!.copyWith(
                      fontSize: 10.sp,
                    ))
              ],
            ),
            SizedBox(height: 2.h),
            Text(
              "task.description!",
              style: theme.textTheme.labelMedium,
            ),
          ],
        ),
      );
    },
  );
}