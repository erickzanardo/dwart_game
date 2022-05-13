import 'package:flame/components.dart';
import 'package:flutter/material.dart';

/// {@template tile}
/// A tile in the world
/// {@entemplate}
class Tile extends RectangleComponent {
  /// {@macro tile}
  Tile({
    Vector2? position,
  }) : super(
          position: position,
          size: Vector2.all(tileSize + 2),
          paint: Paint()..color = Colors.green,
        );

  /// The size of the all tiles on the game.
  static const tileSize = 150.0;
}
