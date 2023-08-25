import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/theme/colors.dart';
import 'package:flutter_tic_tac_toe/widgets/wrapper_container.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../model/history_hive_model.dart';
import '../storage/history_box.dart';
import '../widgets/alert_dialog.dart';
import '../widgets/history_modal.dart';
import '../widgets/scoreboard.dart';

class GameScreen extends StatefulWidget {
  const GameScreen(
      {Key? key, required this.playerXName, required this.playerOName})
      : super(key: key);
  final String playerXName;
  final String playerOName;

  @override
  GameScreenState createState() => GameScreenState();
}

class GameScreenState extends State<GameScreen> {
  List<List<String>> board = List.generate(3, (_) => List.filled(3, ''));
  String currentPlayer = 'X';
  String winner = '';

  void _onCellTap(int row, int col) {
    if (board[row][col].isEmpty) {
      setState(() {
        board[row][col] = currentPlayer;
        if (_checkWin(currentPlayer)) {
          winner = currentPlayer;
          showGameAlertDialog("Player $currentPlayer wins!", context,
              currentPlayer, _resetGame);
          HistoryBox.setHistory(HistoryModelHive(
              playerXName: widget.playerXName,
              playerOName: widget.playerOName,
              winner: winner));
        } else if (_checkDraw()) {
          winner = 'draw';
          showGameAlertDialog("It's a draw!", context, "draw", _resetGame);
          HistoryBox.setHistory(HistoryModelHive(
              playerXName: widget.playerXName,
              playerOName: widget.playerOName,
              winner: winner));
        } else {
          currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
        }
      });
    }
  }

  bool _checkWin(String player) {
    for (int i = 0; i < 3; i++) {
      if ((board[i][0] == player && board[i][1] == player && board[i][2] == player) ||
          (board[0][i] == player && board[1][i] == player && board[2][i] == player)) {
        return true;
      }
    }
    if ((board[0][0] == player && board[1][1] == player && board[2][2] == player) ||
        (board[0][2] == player && board[1][1] == player && board[2][0] == player)) {
      return true;
    }
    return false;
  }


  bool _checkDraw() {
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (board[i][j].isEmpty) {
          return false;
        }
      }
    }
    return true;
  }

  void _resetGame() {
    setState(() {
      board = List.generate(3, (_) => List.filled(3, ''));
      currentPlayer = (winner == 'draw')
          ? ['X', 'O'].elementAt(Random().nextInt(2))
          : winner;
    });
  }

  @override
  Widget build(BuildContext context) =>
     Scaffold(
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
              playerXScore: _checkWin('X') ? 1 : 0,
              playerOScore: _checkWin('O') ? 1 : 0,
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

