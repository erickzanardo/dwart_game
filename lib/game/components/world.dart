import 'dart:async';

import 'package:dwart_components/dwart_components.dart';
import 'package:flame/components.dart';

class World extends PositionComponent {
  World({
    required this.map,
  }) : super(anchor: Anchor.center);

  final List<List<PositionComponent?>> map;

  @override
  Future<void> onLoad() async {
    for (var y = 0; y < map.length; y++) {
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
  }

  Vector2 get mapSize => Vector2(
      map[0].length * Tile.tileSize,
      map.length * Tile.tileSize,
  );
}
