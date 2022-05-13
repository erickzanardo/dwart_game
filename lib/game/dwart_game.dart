import 'dart:math';

import 'package:dwart_components/dwart_components.dart';
import 'package:dwart_game/game/entities/entities.dart';
import 'package:dwart_game/game/game.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';

class DwartGame extends FlameGame
    with PanDetector, ScrollDetector, HasTappables {
  DwartGame() {
    images.prefix = '';
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    final world = World(
      map: [
        [null, null, null, DwarfEntity(), null, null, null],
        [
          null,
          Tile(),
          Tile(),
          Tile(),
          Tile(),
          Tile(),
          null,
        ],
        [
          Tile(),
          Tile(),
          Tile(),
          Tile(),
          Tile(),
          Tile(),
          Tile(),
        ],
      ],
    )..position = size / 2;

    await add(world);

    camera.zoom = 0.5;
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
}
