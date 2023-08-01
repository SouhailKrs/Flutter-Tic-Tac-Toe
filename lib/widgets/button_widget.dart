import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../screens/colors.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {super.key,
      required this.onPressed,
      required this.text,
      this.winner = "draw"});

  final void Function() onPressed;
  final String text;
  final String? winner;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: winner == "X"
            ? GameColors.kBlue
            : winner == "O"
                ? GameColors.kPurple
                : GameColors.kForeground,
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
