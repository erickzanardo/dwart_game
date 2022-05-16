import 'dart:math';

import 'package:dwart_components/dwart_components.dart';
import 'package:dwart_game/game/entities/entities.dart';
import 'package:dwart_game/game/game.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:rxdart/rxdart.dart';

class TileInfo {
  TileInfo({
    required this.x,
    required this.y,
    required this.component,
  });

  final int x;
  final int y;
  final Component? component;
}

class DwartGame extends FlameGame
    with PanDetector, ScrollDetector, HasTappables {
  DwartGame() {
    images.prefix = '';
  }

  BehaviorSubject<TileInfo> tilesAction = BehaviorSubject();

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    final world = World(
      map: [
        [
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
        ],
        [
          Tile(),
          Stairs(),
          Tile(),
          Tile(),
          Bridge(),
          Bridge(),
          Tile(),
          Tile(),
          Tile(),
          Tile(),
          null,
        ],
        [
          Tile(),
          Stairs(),
          Tile(),
          Tile(),
          Tile(),
          Tile(),
          Tile(),
          Tile(),
          Tile(),
          Tile(),
        ],
        [
          Tile(),
          Stairs(),
          null,
          null,
          null,
          null,
          Tile(),
          Tile(),
          Tile(),
          Tile(),
        ],
        [
          Tile(),
          Tile(),
          Tile(),
          Tile(),
          Tile(),
          Tile(),
          Tile(),
          Tile(),
          Tile(),
          Tile(),
        ],
      ],
    );

    await add(world);

    world
      ..addAt(7, 0, DwarfEntity())
      ..addAt(8, 0, DwarfEntity());

    camera
      ..zoom = 0.4
      ..snapTo((world.mapSize / 2) - (size / 2));
  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    camera.snapTo(camera.position - info.delta.game);
  }

  @override
  void onScroll(PointerScrollInfo info) {
    final value = camera.zoom + info.scrollDelta.game.y / 1000;
    camera.zoom = min(2, max(0.2, value));
  }

  @override
  void onTapUp(int pointerId, TapUpInfo info) {
    super.onTapUp(pointerId, info);

    if (!info.handled) {
      final x = (info.eventPosition.game.x / Tile.tileSize).floor();
      final y = (info.eventPosition.game.y / Tile.tileSize).floor();

      final world = children.whereType<World>().single;
      final mapSize = world.mapTitleSize;

      if (x < mapSize.x && y < mapSize.y) {
        tilesAction.add(
          TileInfo(
            x: x,
            y: y,
            component: world.map[y][x],
          ),
        );
      }
    }
  }
}
