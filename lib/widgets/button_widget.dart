import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/theme/app_sizes.dart';

import '../theme/colors.dart';

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
    final colorMap = {
      false: GameColors.kGrey,
      'X': GameColors.kBlue,
      'O': GameColors.kPurple,
    };

    return isEnabled
        ? colorMap[winner] ?? GameColors.kForeground
        : GameColors.kGrey;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        isEnabled ? onPressed() : null;
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: getColor(isEnabled, winner!),
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 24,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: borderRadiusM(),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isEnabled ? GameColors.kWhitish : Colors.black,
        ),
      ),
    );
  }
}
