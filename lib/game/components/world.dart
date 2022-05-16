import 'dart:async';

import 'package:dwart_components/dwart_components.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class World extends PositionComponent {
  World({
    required this.map,
  });

  final List<List<PositionComponent?>> map;
  late final List<List<bool>> path;

  @override
  Future<void> onLoad() async {
    final mapTitleSize = this.mapTitleSize;

    for (var y = 0; y < mapTitleSize.y; y++) {
      final row = map[y];
      for (var x = 0; x < row.length; x++) {
        final component = row[x];
        if (component != null) {
          unawaited(
            add(
              component
                ..position = Vector2(
                  x * Tile.tileSize,
                  y * Tile.tileSize,
                ),
            ),
          );
        }
      }
    }

    _buildPath();
  }

  void addAt(int x, int y, PositionComponent component) {
    add(
      component
        ..position = Vector2(
              x.toDouble(),
              y.toDouble(),
            ) *
            Tile.tileSize,
    );
  }

  void _buildPath() {
    final mapTitleSize = this.mapTitleSize;

    path = List.generate(
      mapTitleSize.y.toInt(),
      (_) => List.filled(
        mapTitleSize.x.toInt(),
        false,
      ),
    );

    for (var y = 0; y < mapTitleSize.y; y++) {
      final row = map[y];
      for (var x = 0; x < row.length; x++) {
        final component = row[x];
        if (component != null) {
          if (component is Walkable) {
            final paths = component.toPaths();
            for (final value in paths) {
              final pathY = y + value.y.toInt();
              final pathX = x + value.x.toInt();

              final atTarget = map[pathY][pathX];
              if (atTarget == null ||
                  (atTarget is Walkable && !atTarget.solid)) {
                path[pathY][pathX] = true;

                // To testing
                //unawaited(
                //  add(
                //    RectangleComponent.square(
                //      position: (Vector2(
                //                pathX.toDouble(),
                //                pathY.toDouble(),
                //              ) *
                //              Tile.tileSize) +
                //          Vector2.all(Tile.tileSize / 2 - 10),
                //      paint: Paint()..color = Colors.yellow,
                //      size: 20,
                //    ),
                //  ),
                //);
              }
            }
          }
        }
      }
    }
  }

  Vector2 get mapTitleSize => Vector2(
        map[0].length.toDouble(),
        map.length.toDouble(),
      );

  Vector2 get mapSize => mapTitleSize * Tile.tileSize;
}
