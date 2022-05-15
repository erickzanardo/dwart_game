import 'package:dwart_components/dwart_components.dart';
import 'package:dwart_game/game/entities/dwarf/dwarf_cubit.dart';
import 'package:dwart_game/game/entities/entities.dart';
import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:flame_bloc/flame_bloc.dart';

class DwarfNameBadgeBehavior extends Behavior<DwarfEntity> {
  DwarfNameBadgeBehavior(this.cubit);
  final DwarfCubit cubit;

  @override
  Future<void> onLoad() async {
    await add(
      FlameBlocListener<DwarfCubit, DwarfState>(
        bloc: cubit,
        listenWhen: (previous, current) =>
            previous.selected != current.selected,
        onNewState: (state) {
          if (state.selected) {
            parent.add(
              DwarfNameBadge(
                text: state.name,
                position: Vector2(parent.size.x / 2, -80),
              ),
            );
          } else {
            parent.firstChild<DwarfNameBadge>()?.removeFromParent();
          }
        },
      ),
    );
  }
}
