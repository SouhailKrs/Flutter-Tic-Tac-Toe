import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/screens/colors.dart';
import 'package:flutter_tic_tac_toe/widgets/parent_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../widgets/scoreboard.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<List<String>> board = List.generate(3, (_) => List.filled(3, ''));
  String currentPlayer = 'X';
String winner = '';
  void _onCellTap(int row, int col) {
    if (board[row][col].isEmpty) {
      setState(() {
        board[row][col] = currentPlayer;
        if (_checkWin(currentPlayer)) {
          winner = currentPlayer;
          _showGameResultDialog("Player $currentPlayer wins!");
        } else if (_checkDraw()) {
          winner = 'draw';
          _showGameResultDialog("It's a draw!");
        } else {
          currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
        }
      });
    }
  }

  void _showGameResultDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Game Over"),
          content: Text(message),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                _resetGame(); // Reset the game after closing the dialog
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }
  bool _checkWin(String player) {
    for (int i = 0; i < 3; i++) {
      if (board[i][0] == player &&
          board[i][1] == player &&
          board[i][2] == player) {
        return true; // Row win
      }
      if (board[0][i] == player &&
          board[1][i] == player &&
          board[2][i] == player) {
        return true;
      }
    }
    if (board[0][0] == player &&
        board[1][1] == player &&
        board[2][2] == player) {
      return true;
    }
    if (board[0][2] == player &&
        board[1][1] == player &&
        board[2][0] == player) {
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
      currentPlayer = (winner == 'draw') ? ['X', 'O'].elementAt(Random().nextInt(2)) : winner;
      });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ParentContainer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScoreBoard(
              playerXScore: _checkWin('X') ? 1 : 0,
              playerOScore: _checkWin('O') ? 1 : 0,
              isTurn: currentPlayer == 'X',
            ),

            SizedBox(
              height: 15.h,
            ),
            Container(
              margin:  EdgeInsets.all(4.0.w),
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
                                  ? GameColors.kBackground
                                  : GameColors.kPurple),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: 9,
              ),
            ),
            const SizedBox(height: 20),
            Text('Player $currentPlayer turn',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.permanentMarker().fontFamily,
                    color: GameColors.kWhitish)),

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _resetGame,
              child: const Text('Reset Game'),
            ),
          ],
        ),
      ),
    );
  }
}
