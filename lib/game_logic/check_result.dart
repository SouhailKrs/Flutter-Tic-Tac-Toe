import 'dart:math';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/game_providers.dart';

bool checkWin(List<List<String>> board, String player) {
  for (int i = 0; i < 3; i++) {
    if ((board[i][0] == player &&
            board[i][1] == player &&
            board[i][2] == player) ||
        (board[0][i] == player &&
            board[1][i] == player &&
            board[2][i] == player)) {
      return true;
    }
  }
  if ((board[0][0] == player &&
          board[1][1] == player &&
          board[2][2] == player) ||
      (board[0][2] == player &&
          board[1][1] == player &&
          board[2][0] == player)) {
    return true;
  }
  return false;
}

bool checkDraw(List<List<String>> board) =>
    board.every((row) => row.every((cell) => cell.isNotEmpty));

void resetGame(String currentPlayerValue, WidgetRef ref,
    {bool isAgainstAI = false}) {
  final boardNotifier = ref.read(boardProvider.notifier);
  final winnerNotifier = ref.read(winnerProvider.notifier);
  boardNotifier.resetBoard();
  if (isAgainstAI) {
    ref.read(currentPlayerProvider.notifier).state = 'X';
  } else if (winnerNotifier.state == 'draw') {
    final newCurrentPlayer = ['X', 'O'][Random().nextInt(2)];
    ref.read(currentPlayerProvider.notifier).state = newCurrentPlayer;
  }

  winnerNotifier.updateWinner('');
}
