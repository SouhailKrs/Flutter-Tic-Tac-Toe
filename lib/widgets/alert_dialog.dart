import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/colors.dart';
import 'button_widget.dart';

void showGameAlertDialog(
    String message, BuildContext context, String winner, Function resetGame) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: GameColors.kLighterForeground,
        elevation: 0,
        title: Text(
          "Game Over",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: GoogleFonts.permanentMarker().fontFamily,
          ),
        ),
        content: Text(
          message,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: GoogleFonts.permanentMarker().fontFamily,
          ),
        ),
        actions: [
          ButtonWidget(
            onPressed: () {
              Navigator.of(context).pop();
              resetGame();
            },
            winner: winner,
            text: 'Play Again',
          ),
        ],
      );
    },
  );
}
