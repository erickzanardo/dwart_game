import 'dart:async';

import 'package:dwart_components/dwart_components.dart';
import 'package:dwart_game/game/dwart_game.dart';
import 'package:dwart_game/game/entities/dwarf/dwarf_cubit.dart';
import 'package:dwart_game/game/entities/dwarf/dwarf_move_behavior.dart';
import 'package:dwart_game/game/entities/entities.dart';
import 'package:dwart_game/game/game.dart';
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
      } else if (value.component != parent && cubit.state.selected) {
        // TODO think on a better way for this
        final actions = <ContextMenuItem>[];

        final target = value.component;
        if (target == null || (target is Walkable && !target.solid)) {
          actions.add(
            ContextMenuItem(
              onTap: () {
                parent.add(
                  DwarfMoveBehavior(
                    Vector2(
                      value.x.toDouble(),
                      value.y.toDouble(),
                    ),
                  ),
                );
              },
              label: 'Move here',
            ),
          );
        }

        actions.add(
          ContextMenuItem(
            onTap: () {
              gameRef.descendants().whereType<ContextMenu>().forEach((element) {
                element.removeFromParent();
              });
            },
            label: 'Cancel',
          ),
        );

        if (actions.length > 1) {
          ancestors().whereType<World>().single.add(
                ContextMenu(
                  position: Vector2(
                        value.x.toDouble(),
                        value.y.toDouble(),
                      ) *
                      Tile.tileSize,
                  items: actions,
                ),
              );
        }
      }
    });
  }

  @override
  bool containsPoint(Vector2 point) => parent.containsPoint(point);

  @override
  bool onTapUp(TapUpInfo info) {
    if (!cubit.state.selected) {
      info.handled = true;
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
