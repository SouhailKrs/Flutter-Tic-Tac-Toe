import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/model/history_hive_model.dart';
import 'package:flutter_tic_tac_toe/screens/game_screen.dart';
import 'package:flutter_tic_tac_toe/screens/main_menu.dart';
import 'package:flutter_tic_tac_toe/storage/history_box.dart';
import 'package:flutter_tic_tac_toe/widgets/history_list.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter((await getApplicationDocumentsDirectory()).path);
  Hive.registerAdapter(HistoryModelHiveAdapter());
  await HistoryBox.openBox();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home:  const GameScreen(playerXName: "aaa", playerOName: "aaas"),
        );
      },
    );

  }
}