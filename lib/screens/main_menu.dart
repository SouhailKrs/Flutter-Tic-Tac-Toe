import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/screens/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import 'game_screen.dart';


class MainMenu extends StatelessWidget {
  const MainMenu({super.key});





  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff1e242d),
              Color(0xff28313D),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Tic Tac Toe',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  fontFamily:
                  GoogleFonts.permanentMarker().fontFamily,

                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20.h),
              MainMenuButtons(
                btnText: 'Single Player',
                onPressed: () {
                  Navigator.pushNamed(context, '/game_screen');
                },
              ),
              SizedBox(height: 2.h),
              MainMenuButtons(
                btnText: 'Multiplayer',
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const GameScreen()));
                },
              ),
              SizedBox(height: 2.h),
              MainMenuButtons(
                btnText: 'Settings',
                onPressed: () {
                  Navigator.pushNamed(context, '/settings_screen');
                },
              ),
            ],
          ),
        ),
      ),

    );
  }
}




class MainMenuButtons extends StatelessWidget {
  const MainMenuButtons({super.key, required this.btnText, required this.onPressed});
  final String btnText;
  final void  Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60.w,
      height: 8.h,
      child: ElevatedButton(

        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: GameColors.kBlueColor,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          btnText,
          style:  TextStyle
            (
            color: GameColors.kWhitish,
            fontFamily: GoogleFonts.permanentMarker().fontFamily,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
