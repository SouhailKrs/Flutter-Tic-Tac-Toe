<h1 align="center"> Tic Tac Toe </h1> <br>





<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Introduction


The famous Tic Tac Toe game built using Flutter. To enhance the user experience, I implemented Hive as the local database, allowing players to view their games later. Additionally, I utilized hooks, a flutter implementation of React hooks,  to efficiently manage the life-cycle of the Widget and better perfomance.



## Features
* **Single Player** : Engage in an exciting challenge against the AI, which employs the powerful MiniMax algorithm - a recursive decision-making approach widely used in game theory. By leveraging the MiniMax algorithm, the AI selects the most optimal moves, assuming the player is making the best possible decisions as well. This makes it an ideal fit for games like Tic Tac Toe, where strategic planning and optimal moves are crucial to secure victory. Prepare for an immersive and intellectually stimulating gaming experience as you take on the AI in this mode. Good luck!

* **Multiplayer** : Compete against friends, set custom names, and choose "X" or "O" to determine the Tic Tac Toe champion!
* **History** : Easily access the record of your past matches, the history is saved using Hive DB.






<p align="center">
  <img src="https://raw.githubusercontent.com/SouhailKrs/Flutter-Tic-Tac-Toe/main/lib/game_screens/main_menu.png" width=170>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <img src="https://raw.githubusercontent.com/SouhailKrs/Flutter-Tic-Tac-Toe/main/lib/game_screens/single_player.png" width=170>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <img src="https://raw.githubusercontent.com/SouhailKrs/Flutter-Tic-Tac-Toe/main/lib/game_screens/player_names.png" width=170>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

</p>
<p align="center">
  <img src="https://raw.githubusercontent.com/SouhailKrs/Flutter-Tic-Tac-Toe/main/lib/game_screens/o_wins.png" width=170>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <img src="https://raw.githubusercontent.com/SouhailKrs/Flutter-Tic-Tac-Toe/main/lib/game_screens/game_history.png" width=170>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</p>






## Build Process

- Follow the [Flutter Guide](https://docs.flutter.dev/) for getting started building a  flutter project.
- Clone or download the repo 

```{r klippy, echo=FALSE, include=TRUE}
git clone https://github.com/SouhailKrs/Flutter-Tic-Tac-Toe

```
- Get dependencies

```{r klippy, echo=FALSE, include=TRUE}
flutter pub get

```
