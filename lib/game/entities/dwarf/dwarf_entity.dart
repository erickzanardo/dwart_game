import 'package:dwart/dwart.dart';
import 'package:dwart_components/dwart_components.dart';
import 'package:dwart_game/game/entities/dwarf/dwarf_cubit.dart';
import 'package:dwart_game/game/entities/dwarf/dwarf_name_badge_behavior.dart';
import 'package:dwart_game/game/entities/dwarf/dwarf_selection_behavior.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:vector_math/vector_math_64.dart';

class DwarfEntity extends Entity with Walkable {
  DwarfEntity() {
    cubit = DwarfCubit(Dwart().generateName(DwarfMood.neutral));
  }

  late final DwarfCubit cubit;

  @override
  Future<void> onLoad() async {
    final dwarf = Dwarf();
    size = dwarf.size;

    await addAll(
      [
        dwarf,
        DwarfSelectionBehavior(cubit),
        DwarfNameBadgeBehavior(cubit),
      ],
    );
  }

  @override
  void onRemove() {
    cubit.close();
  }

  @override
  bool get solid => false;

  @override
  List<Vector2> toPaths() => [];
}
