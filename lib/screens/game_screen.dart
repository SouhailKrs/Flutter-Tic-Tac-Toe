import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_tic_tac_toe/theme/colors.dart';
import 'package:flutter_tic_tac_toe/widgets/wrapper_container.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sizer/sizer.dart';

import '../game_logic/check_result.dart';
import '../model/history_hive_model.dart';
import '../providers/game_providers.dart';
import '../storage/history_box.dart';
import '../widgets/alert_dialog.dart';
import '../widgets/history_modal.dart';
import '../widgets/scoreboard.dart';
import 'game_screen_mult.dart';

final boardProvider = StateNotifierProvider<BoardNotifier, List<List<String>>>(
    (ref) => BoardNotifier());
final currentPlayerProvider =
    StateNotifierProvider<CurrentPlayerNotifier, String>(
        (ref) => CurrentPlayerNotifier());
final winnerProvider =
    StateNotifierProvider<WinnerNotifier, String>((ref) => WinnerNotifier());

class GameBaseScreen extends HookWidget {
  const GameBaseScreen({
    Key? key,
    required this.playerXName,
    required this.playerOName,
  }) : super(key: key);

  final String playerXName;
  final String playerOName;

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
      body:
      GameScreen(
          playerXName: playerXName,
          playerOName: playerOName,
        isAgainstAI: false,

      ),
    );
  }


