import 'package:dwart/game/entities/dwarf/dwarf_selection_behavior.dart';
import 'package:dwart_components/dwart_components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';

class DwarfEntity extends Entity {
  DwarfEntity() : super(
      behaviors: [
        DwarfSelectionBehavior(),
      ],
  );

  @override
  Future<void> onLoad() async {
    final dwarf = Dwarf();
    size = dwarf.size;

    await add(dwarf);
  }
}
