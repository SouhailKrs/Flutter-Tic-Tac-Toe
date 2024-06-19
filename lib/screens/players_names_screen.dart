import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_tic_tac_toe/theme/app_sizes.dart';
import 'package:flutter_tic_tac_toe/theme/colors.dart';
import 'package:flutter_tic_tac_toe/widgets/button_widget.dart';

import '../widgets/wrapper_container.dart';
import 'game_base_screen.dart';

class PlayerNames extends HookWidget {
  const PlayerNames({super.key});

  Widget buildTextField(String hintText, IconData icon, bool isX,
          ValueSetter<String> onChanged, TextEditingController controller) =>
      TextField(
        cursorColor: isX ? GameColors.kWhitish : GameColors.kPurple,
        style: const TextStyle(
          color: GameColors.kWhitish,
        ),
        controller: controller,
        onChanged: onChanged,
        maxLength: 10,
        decoration: InputDecoration(
          counterText: '',
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: borderRadiusM(),
          ),
          fillColor: GameColors.kForeground,
          hintText: hintText,
          hintStyle: const TextStyle(color: GameColors.kBackground),
          prefixIcon: Icon(
            icon,
            color: isX ? GameColors.kBlue : GameColors.kPurple,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final playerXController = useTextEditingController();
    final playerOController = useTextEditingController();
    final isBtnEnabled = useValueNotifier(false);
    void checkFields() {
      isBtnEnabled.value = playerXController.text.isNotEmpty &&
          playerOController.text.isNotEmpty;
    }

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
      ),
      body: WrapperContainer(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Expanded(
                  child: Text(
                    'Enter Player Names',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                gapXL(),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      buildTextField('Player X', Icons.close, true, (value) {
                        checkFields();
                      }, playerXController),
                      gapL(),
                      buildTextField('Player O', Icons.circle_outlined, false,
                          (value) {
                        checkFields();
                      }, playerOController),
                      gap2XL(),
                      SizedBox(
                        width: double.infinity,
                        child: HookBuilder(builder: (context) {
                          final isEnabled = useValueListenable(isBtnEnabled);
                          return ButtonWidget(
                              isEnabled: isEnabled,
                              onPressed: () {
                                if (playerXController.text
                                        .toLowerCase()
                                        .trim() ==
                                    playerOController.text
                                        .toLowerCase()
                                        .trim()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      backgroundColor: GameColors.kForeground,
                                      content: Text(
                                        'Please enter different names',
                                        style: TextStyle(
                                          color: GameColors.kWhitish,
                                        ),
                                      ),
                                    ),
                                  );

                                  return;
                                }
                                FocusScope.of(context).unfocus(
                                    disposition: UnfocusDisposition
                                        .previouslyFocusedChild);

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => GameBaseScreen(
                                      playerOName: playerOController.text
                                          .toLowerCase()
                                          .trim(),
                                      playerXName: playerXController.text
                                          .toLowerCase()
                                          .trim(),
                                      isAgainstAI: false,
                                    ),
                                  ),
                                );
                              },
                              text: 'Start Game');
                        }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
