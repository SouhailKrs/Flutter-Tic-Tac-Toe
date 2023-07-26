import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/screens/colors.dart';
import 'package:flutter_tic_tac_toe/widgets/button_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../widgets/parent_widget.dart';
import 'game_screen.dart';

class PlayerNames extends StatelessWidget {
  const PlayerNames({super.key});

  Widget buildTextField(String hintText, IconData icon, bool isOne) {
    return TextField(
      cursorColor: isOne ? GameColors.kWhitish : GameColors.kPurple,
      style: const TextStyle(color: GameColors.kWhitish),
      decoration: InputDecoration(
        filled: true,
        //<-- SEE HERE
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(3.w)),
        ),
        fillColor: GameColors.kBackgroundDarker,
        hintText: 'Player 1',
        hintStyle: const TextStyle(color: GameColors.kBackground),

        prefixIcon: Icon(
          Icons.close,
          color: isOne ? GameColors.kWhitish : GameColors.kPurple,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  ParentContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Enter Player Names',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: GoogleFonts.permanentMarker().fontFamily,
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          buildTextField('Player 1', Icons.circle_outlined, true),
          SizedBox(
            height: 2.h,
          ),
          buildTextField('Player 2', Icons.close_outlined, false),
          SizedBox(
            height: 2.h,
          ),
          Container(
            width: double.infinity,
            child: ButtonWidget(onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const GameScreen()));

            }, text: 'Start Game'
    )
          )
        ],
      ),
    );
  }
}
