import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/colors.dart';



class ScoreBoard extends StatelessWidget {
  const ScoreBoard({super.key, required this.playerXScore, required this.playerOScore});
final int playerXScore;
final int playerOScore;
  @override
  Widget build(BuildContext context) {
    return    Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Text(
              'Player X',
              style: TextStyle(
                fontSize: 20,
                fontFamily: GoogleFonts.permanentMarker().fontFamily,
                fontWeight: FontWeight.bold,
                color: GameColors.kWhitish,
              ),
            ),
            Text(
            playerXScore.toString(),
              style: TextStyle(
                fontSize: 20,
                fontFamily: GoogleFonts.permanentMarker().fontFamily,
                fontWeight: FontWeight.bold,
                color: GameColors.kWhitish,
              ),
            ),
            const Divider(
              height: 20,
              thickness: 5,
              indent: 20,
              endIndent: 0,
              color: Colors.black,
            ),
          ],
        ),

        Column(
          children: [
            Text(
              'Player 0',
              style: TextStyle(
                fontSize: 20,
                fontFamily: GoogleFonts.permanentMarker().fontFamily,
                fontWeight: FontWeight.bold,
                color: GameColors.kWhitish,
              ),
            ),
            Text(
              playerOScore.toString(),
              style: TextStyle(
                fontSize: 20,
                fontFamily: GoogleFonts.permanentMarker().fontFamily,
                fontWeight: FontWeight.bold,
                color: GameColors.kWhitish,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
