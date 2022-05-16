import 'package:dwart_components/dwart_components.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

/// {@template stairs}
/// A stairs in the world
/// {@entemplate}
class Stairs extends RectangleComponent with Walkable {
  /// {@macro tile}
  Stairs({
    Vector2? position,
  }) : super(
          position: position,
          size: Vector2.all(Tile.tileSize + 2),
          paint: Paint()..color = Colors.brown,
          anchor: Anchor.center,
        );

  @override
  bool get solid => false;

  @override
  List<Vector2> toPaths() => [
        Vector2.zero(),
        Vector2(0, -1),
      ];
}
