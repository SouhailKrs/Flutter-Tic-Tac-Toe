import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../theme/colors.dart';

class ScoreBoard extends StatelessWidget {
  const ScoreBoard({
    super.key,
    required this.playerXScore,
    required this.playerOScore,
    required this.isTurn,
    required this.playerXName,
    required this.playerOName,
  });

  final int playerXScore;
  final int playerOScore;
  final bool isTurn;
  final String playerXName;
  final String playerOName;

  Widget _buildPlayerScore(String playerLabel, int score, bool isTurn) =>
      Container(
        padding: EdgeInsets.all(5.0.w),
        width: 40.0.w,
        height: 35.0.w,
        decoration: BoxDecoration(
          color: GameColors.kForeground,
          borderRadius: BorderRadius.circular(3.0.w),
          border: isTurn
              ? playerLabel == playerXName
              ? Border.all(
            color: GameColors.kBlue,
            width: 2.0,
          )
              : Border.all(
            color: GameColors.kPurple,
            width: 2.0,
          )
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              playerLabel,
              style: TextStyle(
                fontSize: 10.sp,
                fontFamily: GoogleFonts
                    .permanentMarker()
                    .fontFamily,
                fontWeight: FontWeight.bold,
                color: playerLabel == playerXName ? Colors.blue : Colors.purple,
              ),
            ),
            Text(
              score.toString(),
              style: TextStyle(
                fontSize: 20,
                fontFamily: GoogleFonts
                    .caveat()
                    .fontFamily,
                fontWeight: FontWeight.bold,
                color: GameColors.kWhitish,
              ),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildPlayerScore(playerXName, playerXScore, isTurn),
          _buildPlayerScore(playerOName, playerOScore, !isTurn),
        ],
      );
}
