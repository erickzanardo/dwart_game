import 'package:dwart_game/game/dwart_game.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class GameView extends StatelessWidget {
  const GameView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GameWidget(game: DwartGame());
  }
}
