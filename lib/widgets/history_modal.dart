import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/theme/colors.dart';
import 'package:flutter_tic_tac_toe/widgets/history_list.dart';

void buildHistoryBottomSheet(BuildContext context) {
  showModalBottomSheet<void>(
    backgroundColor: GameColors.kLighterForeground,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(15.0),
      ),
    ),
    elevation: 0,
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return const SizedBox(
        height: 500,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: HistoryListView(),
        ),
      );
    },
  );
}
