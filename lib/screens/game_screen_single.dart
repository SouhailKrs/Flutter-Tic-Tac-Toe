import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/screens/colors.dart';
import 'package:flutter_tic_tac_toe/widgets/button_widget.dart';
import 'package:flutter_tic_tac_toe/widgets/wrapper_container.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../Algorithm/minimax_algorithm.dart';
import '../model/history_hive_model.dart';
import '../storage/history_box.dart';
import '../widgets/alert_dialog.dart';
import '../widgets/history_modal.dart';
import '../widgets/scoreboard.dart';

class GameScreenSingle extends StatefulWidget {
  const GameScreenSingle(
      {Key? key, required this.playerXName, required this.playerOName})
      : super(key: key);
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
        if (checkWin(board,currentPlayer)) {
          winner = currentPlayer;
          showGameAlertDialog("Player $currentPlayer wins!", context,
              currentPlayer, _resetGame);
          HistoryBox.setHistory(HistoryModelHive(
              playerXName: widget.playerXName,
              playerOName: widget.playerOName,
              winner: winner));
        } else if (checkDraw(board)) {
          winner = 'draw';
          showGameAlertDialog("It's a draw!", context, "draw", _resetGame);
          HistoryBox.setHistory(HistoryModelHive(
              playerXName: widget.playerXName,
              playerOName: widget.playerOName,
              winner: winner));
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
    int bestScore = -1000;
    int row = -1;
    int col = -1;
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (board[i][j].isEmpty) {
          board[i][j] = 'O';
          int score = minimax(board, false);
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


  int minimax(   List<List<String>> board, bool isMaximizing) {
    if (checkWin(board,'O')) {
      return 1;
    } else if (checkWin(board,'X')) {
      return -1;
    } else if (checkDraw(board)) {
      return 0;
    }

    if (isMaximizing) {
      int bestScore = -1000;
      for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
          if (board[i][j].isEmpty) {
            board[i][j] = 'O';
            int score = minimax(board, false);
            board[i][j] = '';
            bestScore = max(score, bestScore);
          }
        }
      }
      return bestScore;
    } else {
      int bestScore = 1000;
      for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
          if (board[i][j].isEmpty) {
            board[i][j] = 'X';
            int score = minimax(board, true);
            board[i][j] = '';
            bestScore = min(score, bestScore);
          }
        }
      }
      return bestScore;
    }
  }



  void _resetGame() {
    setState(() {
      board = List.generate(3, (_) => List.filled(3, ''));
      currentPlayer = 'X';
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              playerXScore: checkWin(board,'X') ? 1 : 0,
              playerOScore: checkWin(board,'O') ? 1 : 0,
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
                    onTap: () => _onCellTap(row, col),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
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
                                  : GameColors.kPurple),
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
}
