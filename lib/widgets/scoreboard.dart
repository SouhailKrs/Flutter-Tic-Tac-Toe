import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../screens/colors.dart';

class ScoreBoard extends StatelessWidget {
  const ScoreBoard({super.key, required this.playerXScore, required this.playerOScore, required this.isTurn});
  final int playerXScore;
  final int playerOScore;
  final bool isTurn ;

  // Common function to create Text widgets with shared styles
  Widget _buildPlayerScore(String playerLabel, int score , bool isTurn ) {
    return Container(

      padding:  EdgeInsets.all(5.0.w),
  decoration: BoxDecoration(
    color: GameColors.kBackgroundDarker,
      borderRadius: BorderRadius.circular(3.0.w),
border: isTurn ? Border.all(color: GameColors.kBlueColor, width: 0.5.w) : null,
  ),
      child: Column(
        children: [

          Text(
            playerLabel,
            style: TextStyle(
              fontSize: 20,
              fontFamily: GoogleFonts.permanentMarker().fontFamily,
              fontWeight: FontWeight.bold,
              color: GameColors.kWhitish,
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
        _buildPlayerScore('Player X', playerXScore , isTurn),
        _buildPlayerScore('Player O', playerOScore , !isTurn),
      ],
    );
  }
}
