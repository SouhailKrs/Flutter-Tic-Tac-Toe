<h1 align="center"> Tic Tac Toe </h1> <br>





<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Introduction

The classic Tic Tac Toe game built using Flutter. To enhance the user experience, I implemented Hive
as the local database, allowing players to view their games later. Additionally, I utilized hooks, a
flutter implementation of React hooks, and Riverpod to efficiently manage the life-cycle of the
Widget and state managment.
## Features

* **Single Player** : Challenge yourself against an AI powered by the ****MiniMax**** algorithm, known for its strategic decision-making in game theory. Experience an engaging gameplay where the AI selects optimal moves, making every match a test of your skills.

* **Multiplayer** : Compete against friends, customize player names, and choose "X" or "O" to determine
  the Tic Tac Toe champion!
* **History** :  Easily access and review your past matches, stored locally using Hive.

## State Management

This project utilizes Hooks and Riverpod for efficient state management:


* [**Hooks**](https://pub.dev/packages/flutter_hooks)

Inspired by their React counterparts, Hooks offer a functional and reusable approach to constructing components, improving upon the usage of StatefulWidget. For instance, when using text field controllers, you have to manually dispose of them to prevent memory leaks, whereas hooks handle this automatically (useTextEditingController).
* [**Riverpod**](https://pub.dev/packages/riverpod)

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
