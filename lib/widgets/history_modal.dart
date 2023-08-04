
import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/screens/colors.dart';
import 'package:flutter_tic_tac_toe/widgets/history_list.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';


void buildHistoryBottomSheet(BuildContext context) {
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
      return SizedBox(
        height: 70.h, // Set the desired height
        child: HistoryListView(

        ),
      );
    },
  );
}