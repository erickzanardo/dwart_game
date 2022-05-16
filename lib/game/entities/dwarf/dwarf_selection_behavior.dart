import 'dart:async';

import 'package:dwart_game/game/dwart_game.dart';
import 'package:dwart_game/game/entities/dwarf/dwarf_cubit.dart';
import 'package:dwart_game/game/entities/entities.dart';
import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';

class DwarfSelectionBehavior extends Behavior<DwarfEntity> with HasGameRef<DwartGame> {
  DwarfSelectionBehavior(this.cubit);

  final DwarfCubit cubit;

  late final StreamSubscription _subscription;

  @override
  Future<void> onLoad() async {
    _subscription = gameRef.tilesAction.listen((value) {
      if (value.component == parent && !cubit.state.selected) {
        cubit.select();
      } else if (value.component is DwarfEntity && value.component != parent) {
        cubit.unselect();
      }
    });
  }

  @override
  void onRemove() {
    _subscription.cancel();
  }
}
