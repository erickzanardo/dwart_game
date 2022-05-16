import 'dart:ui';

import 'package:a_star_algorithm/a_star_algorithm.dart' as a_star;
import 'package:dwart_components/dwart_components.dart';
import 'package:dwart_game/game/entities/entities.dart';
import 'package:dwart_game/game/game.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:flutter/material.dart';

class DwarfMoveBehavior extends Behavior<DwarfEntity>
    with HasGameRef<DwartGame> {
  DwarfMoveBehavior(this.target);

  final Vector2 target;
  late final List<Vector2> path;

  @override
  Future<void> onLoad() async {
    final world = gameRef.descendants().whereType<World>().single;

    final barriers = <Offset>[];

    for (var y = 0; y < world.path.length; y++) {
      for (var x = 0; x < world.path[y].length; x++) {
        if (!world.path[y][x]) {
          barriers.add(Offset(x.toDouble(), y.toDouble()));
        }
      }
    }

    final tileSize = world.mapTitleSize;

    final start = Offset(
      (parent.x / Tile.tileSize).floorToDouble(),
      (parent.y / Tile.tileSize).floorToDouble(),
    );

    path = a_star.AStar(
      rows: tileSize.y.toInt(),
      columns: tileSize.x.toInt(),
      start: start,
      end: target.toOffset(),
      barriers: barriers,
    )
        .findThePath()
        .map(
          (step) => Vector2(
            step.dx * Tile.tileSize,
            step.dy * Tile.tileSize,
          ),
        )
        .toList()
      ..removeAt(0);

    await parent.firstChild<Dwarf>()?.add(
          SequenceEffect(
            [
              MoveEffect.to(
                Vector2(0, -20),
                EffectController(duration: 0.2, curve: Curves.easeOut),
              ),
              MoveEffect.to(
                Vector2(0, 0),
                EffectController(duration: 0.2, curve: Curves.easeIn),
              ),
            ],
            infinite: true,
          ),
        );

    _processStep();
  }

  void _processStep() {
    if (path.isNotEmpty) {
      final step = path.removeAt(0);
      if (!parent.facingRight && step.x > parent.x) {
        parent
          ..flipHorizontallyAroundCenter()
          ..facingRight = true;
      } else if (parent.facingRight && step.x < parent.x) {
        parent
          ..flipHorizontallyAroundCenter()
          ..facingRight = false;
      }
      parent.add(
        MoveEffect.to(
          Vector2(step.x, step.y),
          EffectController(duration: 1),
        )..onFinishCallback = _processStep,
      );
    } else {
      final body = parent.firstChild<Dwarf>();
      body?.firstChild<SequenceEffect>()?.removeFromParent();
      body?.position.y = 0;

      removeFromParent();
    }
  }
}
