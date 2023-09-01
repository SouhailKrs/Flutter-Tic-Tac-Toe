<h1 align="center"> Tic Tac Toe </h1> <br>





<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Introduction

The classic Tic Tac Toe game built using Flutter. To enhance the user experience, I implemented Hive
as the local database, allowing players to view their games later. Additionally, I utilized hooks, a
flutter implementation of React hooks, and Riverpod to efficiently manage the life-cycle of the
Widget and state managment.

## Features

* **Single Player** : Engage in an exciting challenge against the AI, which employs the powerful
  MiniMax algorithm - a recursive decision-making approach widely used in game theory. By leveraging
  the MiniMax algorithm, the AI selects the most optimal moves, assuming the player is making the
  best possible decisions as well. This makes it an ideal fit for games like Tic Tac Toe, where
  strategic planning and optimal moves are crucial to secure victory. Prepare for an immersive and
  intellectually stimulating gaming experience as you take on the AI in this mode. Good luck!

* **Multiplayer** : Compete against friends, set custom names, and choose "X" or "O" to determine
  the Tic Tac Toe champion!
* **History** : Easily access the record of your past matches, the history is saved using Hive DB.

## State Management

In this project, I've utilized two powerful tools for state management in Flutter: Hooks and
Riverpod.

* **Hooks**

Inspired by their React counterparts, Hooks offer a functional and reusable approach to constructing
components. They facilitate state management, handling side effects, and more – all nestled within
your functional Flutter components. By embracing hooks, I've achieved superior code organization and
mitigated the intricacies of widget life-cycle management.

* **Riverpod**

Riverpod, a state management library, distinguishes itself through its emphasis on simplicity,
performance, and scalability. This library seamlessly integrates into Flutter's ecosystem and
furnishes an accessible interface. Employing Riverpod, I've adeptly overseen the application's
state, simplifying the management of intricate interplays among distinct components.

Combining Hooks and Riverpod has enabled me to create a cleaner and more efficient architecture for
the Tic Tac Toe game, resulting in improved performance and maintainability.

<p align="center">
  <img src="https://raw.githubusercontent.com/SouhailKrs/Flutter-Tic-Tac-Toe/main/lib/screenshots/main_menu.png" width=170>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <img src="https://raw.githubusercontent.com/SouhailKrs/Flutter-Tic-Tac-Toe/main/lib/screenshots/single_player.png" width=170>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <img src="https://raw.githubusercontent.com/SouhailKrs/Flutter-Tic-Tac-Toe/main/lib/screenshots/player_names.png" width=170>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

</p>
<p align="center">
  <img src="https://raw.githubusercontent.com/SouhailKrs/Flutter-Tic-Tac-Toe/main/lib/screenshots/o_wins.png" width=170>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <img src="https://raw.githubusercontent.com/SouhailKrs/Flutter-Tic-Tac-Toe/main/lib/screenshots/game_history.png" width=170>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</p>

## Build Process

- Follow the [Flutter Guide](https://docs.flutter.dev/) for getting started building a flutter
  project.
- Clone or download the repo

```{r klippy, echo=FALSE, include=TRUE}
git clone https://github.com/SouhailKrs/Flutter-Tic-Tac-Toe
```

- Get dependencies

```{r klippy, echo=FALSE, include=TRUE}
flutter pub get
```
