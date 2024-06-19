import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/theme/colors.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/game_providers.dart';
import '../widgets/history_modal.dart';
import 'game_screen.dart';

class GameBaseScreen extends HookConsumerWidget {
  const GameBaseScreen({
    Key? key,
    required this.isAgainstAI,
    required this.playerXName,
    required this.playerOName,
  }) : super(key: key);

  final String playerXName;
  final String playerOName;
  final bool isAgainstAI;

  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
        appBar: AppBar(
          backgroundColor: GameColors.kGradient1,
          leading: IconButton(
            onPressed: () {
              final BoardNotifier boardNotifier =
                  ref.read(boardProvider.notifier);
              boardNotifier.resetBoard();
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_outlined,
              color: GameColors.kWhitish,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                buildHistoryBottomSheet(context);
              },
              icon: const Icon(
                Icons.history_outlined,
                color: GameColors.kWhitish,
              ),
            ),
          ],
        ),
        body: GameScreen(
          playerXName: playerXName,
          playerOName: playerOName,
          isAgainstAI: isAgainstAI,
        ),
      );
}
