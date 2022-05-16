import 'dart:async';

import 'package:dwart_components/dwart_components.dart';
import 'package:dwart_game/game/dwart_game.dart';
import 'package:dwart_game/game/entities/dwarf/dwarf_cubit.dart';
import 'package:dwart_game/game/entities/entities.dart';
import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flame_behaviors/flame_behaviors.dart';

class DwarfSelectionBehavior extends Behavior<DwarfEntity>
    with HasGameRef<DwartGame>, Tappable {
  DwarfSelectionBehavior(this.cubit);

  final DwarfCubit cubit;

  late final StreamSubscription _subscription;

  @override
  Future<void> onLoad() async {
    _subscription = gameRef.tilesAction.listen((value) {
      if (value.component is DwarfEntity && value.component != parent) {
        cubit.unselect();
      }
    });
  }

  @override
  bool containsPoint(Vector2 point) => parent.containsPoint(point);

  @override
  bool onTapUp(TapUpInfo info) {
    if (!cubit.state.selected) {
      cubit.select();
      gameRef.tilesAction.add(
          TileInfo(
            x: (parent.x / Tile.tileSize).floor(),
            y: (parent.y / Tile.tileSize).floor(),
            component: parent,
          ),
      );
    }
    return true;
  }

  @override
  void onRemove() {
    _subscription.cancel();
  }
}
