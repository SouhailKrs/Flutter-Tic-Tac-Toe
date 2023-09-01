import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sizer/sizer.dart';

import '../game_logic/check_result.dart';
import '../game_logic/minimax.dart';
import '../model/history_hive_model.dart';
import '../providers/game_providers.dart';
import '../storage/history_box.dart';
import '../theme/colors.dart';
import '../widgets/alert_dialog.dart';
import '../widgets/scoreboard.dart';
import '../widgets/wrapper_container.dart';

int playerXScore = 0;
int playerOScore = 0;
bool isAIPlaying = false;

class GameScreen extends ConsumerWidget {
  final String playerXName;
  final String playerOName;
  final bool isAgainstAI;

  const GameScreen({
    Key? key,
    required this.playerXName,
    required this.playerOName,
    required this.isAgainstAI,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final board = ref.watch(boardProvider);
    final currentPlayer = ref.watch(currentPlayerProvider);
    final winner = ref.watch(winnerProvider);

    void makeAIMove(boardNotifier, currentPlayerNotifier, winnerNotifier,
        BuildContext context) {
      int bestScore = -1000;
      int bestMoveRow = -1;
      int bestMoveCol = -1;

      for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
          if (board[i][j].isEmpty) {
            board[i][j] = 'O';
            int score = minimax(board, false);
            board[i][j] = '';

            if (score > bestScore) {
              bestScore = score;
              bestMoveRow = i;
              bestMoveCol = j;
            }
          }
        }
      }

      if (bestMoveRow != -1 && bestMoveCol != -1) {
        boardNotifier.updateBoard(bestMoveRow, bestMoveCol, 'O');

        if (checkWin(board, 'O')) {
          winnerNotifier.updateWinner('O');
          playerOScore++;
          showGameAlertDialog(
            "AI wins!",
            context,
            'O',
                () => resetGame('O', ref, isAgainstAI: isAgainstAI),
          );
        } else if (checkDraw(board)) {
          winnerNotifier.updateWinner('draw');
          showGameAlertDialog(
            "It's a draw!",
            context,
            'draw',
                () => resetGame('draw', ref, isAgainstAI: isAgainstAI),
          );
        } else {
          currentPlayerNotifier.togglePlayer();
        }
      }
    }

    void onCellTap(int row, int col) {
      final boardNotifier = ref.read(boardProvider.notifier);
      final currentPlayerNotifier = ref.read(currentPlayerProvider.notifier);
      final winnerNotifier = ref.read(winnerProvider.notifier);

      if (board[row][col].isEmpty && winner.isEmpty) {
        final currentPlayerValue = currentPlayer;
        boardNotifier.updateBoard(row, col, currentPlayerValue);

        if (checkWin(board, currentPlayerValue)) {
          winnerNotifier.updateWinner(currentPlayerValue);
          if (currentPlayerValue == 'X') {
            playerXScore++;
          } else {
            playerOScore++;
          }
          showGameAlertDialog(
            "Player $currentPlayerValue wins!",
            context,
            currentPlayerValue,
                () => resetGame(currentPlayerValue, ref),
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
                () => resetGame(currentPlayerValue, ref),
          );
          HistoryBox.setHistory(HistoryModelHive(
            playerXName: playerXName,
            playerOName: playerOName,
            winner: 'draw',
          ));
        } else {
          currentPlayerNotifier.togglePlayer();
          if (isAgainstAI && currentPlayerValue == 'X') {
            isAIPlaying = true;
            Future.delayed(const Duration(milliseconds: 500), () {
              makeAIMove(boardNotifier, currentPlayerNotifier, winnerNotifier,
                  context);
              isAIPlaying = false;
            });
          }
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
                  playerXScore: playerXScore,
                  playerOScore: playerOScore,
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
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                    ),
                    itemBuilder: (context, index) {
                      int row = index ~/ 3;
                      int col = index % 3;

                      return GestureDetector(
                        onTap: () {
                          if (!isAIPlaying) {
                            onCellTap(row, col);
                          }
                        },
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
                                GoogleFonts
                                    .permanentMarker()
                                    .fontFamily,
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
