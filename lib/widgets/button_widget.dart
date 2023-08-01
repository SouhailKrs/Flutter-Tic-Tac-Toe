import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../screens/colors.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {super.key,
      required this.onPressed,
      required this.text,
      this.isEnabled = true,
      this.winner = "draw"});

  final void Function() onPressed;
  final String text;
  final String? winner;
  final bool isEnabled;
  Color getColor(bool isEnabled, String winner) {
    if (!isEnabled) {
      return GameColors.kGrey;
    } else if (winner == "X") {
      return GameColors.kBlue;
    } else if (winner == "O") {
      return GameColors.kPurple;
    } else {
      return GameColors.kForeground;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (isEnabled) {
          onPressed();
          print("winner is $winner");
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: getColor(isEnabled, winner!),
        padding: EdgeInsets.symmetric(
          vertical: 2.h,
          horizontal: 5.w,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3.w),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontFamily: GoogleFonts.permanentMarker().fontFamily,
        ),
      ),
    );
  }
}
