import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../screens/colors.dart';

class ScoreBoard extends StatelessWidget {
  const ScoreBoard({
    super.key,
    required this.playerXScore,
    required this.playerOScore,
    required this.isTurn,
  });

  final int playerXScore;
  final int playerOScore;
  final bool isTurn;

  Widget _buildPlayerScore(String playerLabel, int score, bool isTurn) {
    return Container(
      padding: EdgeInsets.all(5.0.w),
      decoration: BoxDecoration(
        color: GameColors.kBackgroundDarker,
        borderRadius: BorderRadius.circular(3.0.w),
        border: isTurn
            ? playerLabel == 'Player X'
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
        children: [
          Text(
            playerLabel,
            style: TextStyle(
              fontSize: 20,
              fontFamily: GoogleFonts.permanentMarker().fontFamily,
              fontWeight: FontWeight.bold,
              color: playerLabel == 'Player X'
                  ? Colors.blue
                  : Colors.purple,
            ),
          ),
          Text(
            score.toString(),
            style: TextStyle(
              fontSize: 20,
              fontFamily: GoogleFonts.permanentMarker().fontFamily,
              fontWeight: FontWeight.bold,
              color: GameColors.kWhitish,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildPlayerScore('Player X', playerXScore, isTurn),
        _buildPlayerScore('Player O', playerOScore, !isTurn),
      ],
    );
  }
}
