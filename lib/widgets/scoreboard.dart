import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../screens/colors.dart';

class ScoreBoard extends StatelessWidget {
  const ScoreBoard({super.key, required this.playerXScore, required this.playerOScore});
  final int playerXScore;
  final int playerOScore;

  // Common function to create Text widgets with shared styles
  Widget _buildPlayerScore(String playerLabel, int score) {
    return Column(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildPlayerScore('Player X', playerXScore),
        _buildPlayerScore('Player O', playerOScore),
      ],
    );
  }
}
