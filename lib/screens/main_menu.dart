import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/screens/players_names_screen.dart';
import 'package:flutter_tic_tac_toe/theme/app_sizes.dart';
import 'package:flutter_tic_tac_toe/theme/colors.dart';
import 'package:flutter_tic_tac_toe/widgets/wrapper_container.dart';

import 'game_base_screen.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return WrapperContainer(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Tic Tac Toe',
              style: TextStyle(
                fontSize: 50,
                color: Colors.white,
              ),
            ),
            gap4XL(),
            MainMenuButtons(
              btnText: 'Single Player',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GameBaseScreen(
                      playerOName: "AI",
                      playerXName: "You",
                      isAgainstAI: true,
                    ),
                  ),
                );
              },
            ),
            gapXL(),
            MainMenuButtons(
              btnText: 'Multiplayer',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PlayerNames()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MainMenuButtons extends StatelessWidget {
  const MainMenuButtons(
      {super.key, required this.btnText, required this.onPressed});

  final String btnText;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: GameColors.kForeground,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            btnText,
            style: const TextStyle(
              color: GameColors.kWhitish,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
}
