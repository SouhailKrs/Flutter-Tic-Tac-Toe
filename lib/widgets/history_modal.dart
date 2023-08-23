import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/screens/colors.dart';
import 'package:flutter_tic_tac_toe/widgets/history_list.dart';
import 'package:sizer/sizer.dart';

void buildHistoryBottomSheet(BuildContext context) {
  showModalBottomSheet<void>(
    backgroundColor: GameColors.kLighterForeground,
    shape: const RoundedRectangleBorder(
      // <-- SEE HERE
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(15.0),
      ),
    ),

    elevation: 0,
    isScrollControlled: true,
    // Enable scroll control for dynamic height
    context: context,
    builder: (context) {
      return SizedBox(
        height: 50.h, // Set the desired height
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: HistoryListView(),
        ),
      );
    },
  );
}
