import 'dart:math';

import '../game_logic/check_result.dart';

int minimax(List<List<String>> board, bool isMaximizing) {
  if (checkWin(board, 'O')) {
    return 1;
  } else if (checkWin(board, 'X')) {
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
