import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/theme/colors.dart';
import 'package:flutter_tic_tac_toe/widgets/wrapper_container.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../game_logic/check_result.dart';
import '../game_logic/minimax.dart';
import '../model/history_hive_model.dart';
import '../storage/history_box.dart';
import '../widgets/alert_dialog.dart';
import '../widgets/history_modal.dart';
import '../widgets/scoreboard.dart';

class GameScreenSingle extends StatefulWidget {
  const GameScreenSingle({
    Key? key,
    required this.playerXName,
    required this.playerOName,
  }) : super(key: key);

  final String playerXName;
  final String playerOName;

  @override
  GameScreenSingleState createState() => GameScreenSingleState();
}

class GameScreenSingleState extends State<GameScreenSingle> {
  List<List<String>> board = List.generate(3, (_) => List.filled(3, ''));
  String currentPlayer = 'X';
  String winner = '';

  void _onCellTap(int row, int col) {
    if (board[row][col].isEmpty) {
      setState(() {
        board[row][col] = currentPlayer;
        if (checkWin(board, currentPlayer)) {
          _handleGameResult("Player $currentPlayer wins!");
        } else if (checkDraw(board)) {
          _handleGameResult("It's a draw!", "draw");
        } else {
          currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
          if (currentPlayer == 'O') {
            bestMove();
          }
        }
      });
    }
  }

  void bestMove() {
    var bestScore = -1000;
    var row = -1;
    var col = -1;
    for (var i = 0; i < 3; i++) {
      for (var j = 0; j < 3; j++) {
        if (board[i][j].isEmpty) {
          board[i][j] = 'O';
          var score = minimax(board, false);
          board[i][j] = '';
          if (score > bestScore) {
            bestScore = score;
            row = i;
            col = j;
          }
        }
      }
    }
    Future.delayed(const Duration(milliseconds: 500), () {
      if (row != -1 && col != -1) {
        _onCellTap(row, col);
      }
    });
  }

  void _handleGameResult(String message, [String result = '']) {
    setState(() {
      winner = result;
      showGameAlertDialog(message, context, result, _resetGame);
      HistoryBox.setHistory(
        HistoryModelHive(
          playerXName: widget.playerXName,
          playerOName: widget.playerOName,
          winner: winner,
        ),
      );
    });
  }

  void _resetGame() {
    setState(() {
      board = List.generate(3, (_) => List.filled(3, ''));
      currentPlayer = 'X';
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: GameColors.kGradient1,
          leading: IconButton(
            onPressed: () {
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
        body: WrapperContainer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ScoreBoard(
                playerXName: widget.playerXName,
                playerOName: widget.playerOName,
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
                    final row = index ~/ 3;
                    final col = index % 3;

                    return GestureDetector(
                      onTap: () => _onCellTap(row, col),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
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
      );
}
