import 'package:dwart_game/game/entities/dwarf/dwarf_cubit.dart';
import 'package:dwart_game/game/entities/entities.dart';
import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flame_behaviors/flame_behaviors.dart';

class DwarfSelectionBehavior extends Behavior<DwarfEntity> with Tappable {

  DwarfSelectionBehavior(this.cubit);

  final DwarfCubit cubit;

  @override
  bool containsPoint(Vector2 point) {
    return parent.containsPoint(point);
  }

  @override
  bool onTapUp(TapUpInfo info) {
    cubit.select();
    return true;
  }
}
