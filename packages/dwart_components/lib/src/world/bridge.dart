import 'package:dwart_components/dwart_components.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

/// {@template bridge}
/// A bridge in the world
/// {@entemplate}
class Bridge extends PositionComponent with Walkable {
  /// {@macro tile}
  Bridge({
    Vector2? position,
  }) : super(
          position: position,
          size: Vector2.all(Tile.tileSize + 2),
          children: [
            RectangleComponent(
              position: Vector2.zero(),
              paint: Paint()..color = Colors.brown,
              size: Vector2(Tile.tileSize, 12),
            ),
          ],
        );

  @override
  bool get solid => false;

  @override
  List<Vector2> toPaths() => [
    Vector2(0, -1),
  ];
}
