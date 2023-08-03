import 'dart:io';

import 'package:hive/hive.dart';

part 'history_hive_model.g.dart';

@HiveType(typeId: 0)
class HistoryModelHive {
  HistoryModelHive({
    required this.playerXName,
    required this.playerOName,
    required this.winner,
    DateTime? date,
  }) : date = date ?? DateTime.now();

  @HiveField(1)
  String playerXName;
  @HiveField(2)
  String playerOName;
  @HiveField(3)
  String winner;
  @HiveField(4)
  DateTime date;
}
class HistoryBox {

  static const String historyBoxName = 'historyBox';
}