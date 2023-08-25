import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sizer/sizer.dart';

import '../game_logic/check_result.dart';
import '../model/history_hive_model.dart';
import '../storage/history_box.dart';
import '../theme/colors.dart';
import '../widgets/alert_dialog.dart';
import '../widgets/scoreboard.dart';
import '../widgets/wrapper_container.dart';
import 'game_screen.dart';
class GameScreenMulti extends ConsumerWidget {
  final String playerXName;
  final String playerOName;

  const GameScreenMulti({
    Key? key,
    required this.playerXName,
    required this.playerOName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final board = ref.watch(boardProvider);
    final currentPlayer = ref.watch(currentPlayerProvider);
    final winner = ref.watch(winnerProvider);



    void onCellTap(int row, int col) {
      final boardNotifier = ref.read(boardProvider.notifier);
      final currentPlayerNotifier = ref.read(currentPlayerProvider.notifier);
      final winnerNotifier = ref.read(winnerProvider.notifier);

      if (board[row][col].isEmpty && winner.isEmpty) {
        final currentPlayerValue = currentPlayer;
        boardNotifier.updateBoard(row, col, currentPlayerValue);

        if (checkWin(board, currentPlayerValue)) {
          winnerNotifier.updateWinner(currentPlayerValue);
          showGameAlertDialog(
            "Player $currentPlayerValue wins!",
            context,
            currentPlayerValue,
                () => resetGame(currentPlayerValue,ref),
          );
          HistoryBox.setHistory(HistoryModelHive(
            playerXName: playerXName,
            playerOName: playerOName,
            winner: currentPlayerValue,
          ));
        } else if (checkDraw(board)) {
          winnerNotifier.updateWinner('draw');
          showGameAlertDialog(
            "It's a draw!",
            context,
            "draw",
                () => resetGame(currentPlayerValue,ref),
          );
          HistoryBox.setHistory(HistoryModelHive(
            playerXName: playerXName,
            playerOName: playerOName,
            winner: 'draw',
          ));
        } else {
          currentPlayerNotifier.togglePlayer();
        }
      }
    }

    return Scaffold(
      body: WrapperContainer(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ScoreBoard(
                  playerXName: playerXName,
                  playerOName: playerOName,
                  playerXScore: checkWin(board, 'X') ? 1 : 0,
                  playerOScore: checkWin(board, 'O') ? 1 : 0,
                  isTurn: currentPlayer == 'X',
                ),
                SizedBox(
                  height: 15.h,
                ),
                Container(
                  margin: EdgeInsets.all(4.0.w),
                  child: GridView.builder(
                    padding: const EdgeInsets.all(5.0),
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                    ),
                    itemBuilder: (context, index) {
                      int row = index ~/ 3;
                      int col = index % 3;

                      return GestureDetector(
                        onTap: () => onCellTap(row, col),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              board[row][col],
                              style: TextStyle(
                                fontSize: 50,
                                fontFamily:
                                GoogleFonts.permanentMarker().fontFamily,
                                fontWeight: FontWeight.bold,
                                color: board[row][col] == 'X'
                                    ? GameColors.kBlue
                                    : GameColors.kPurple,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: 9,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}