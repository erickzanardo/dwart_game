import 'package:dwart_components/dwart_components.dart';
import 'package:dwart_components/gen/assets.gen.dart';
import 'package:flame/components.dart';

/// List of head gears
enum HeadGear {
  /// basic
  basic,

  /// miner
  miner,
}

/// Add mapping helpers to [HeadGear]
extension HeadGearX on HeadGear {
  /// Return the data of this gear
  DwarfGear toData() {
    switch (this) {
      case HeadGear.basic:
        return DwarfGear(
          sprite: Assets.images.dwarf.hat.keyName,
          position: Vector2(0, -27.4),
          size: Vector2(97.1, 66.7),
        );
      case HeadGear.miner:
        return DwarfGear(
          sprite: Assets.images.dwarf.minerHat.keyName,
          position: Vector2(0, -33.9),
          size: Vector2(97.1, 73.2),
        );
    }
  }
}

/// {@template dwarf_hat}
/// The hat of a [Dwarf]
/// {@endtemplate}
class DwarfHat extends SpriteComponent with HasGameRef {
  /// {@macro dwarf_hat}
  DwarfHat({
    required HeadGear head,
  }) : super(priority: 3) {
    final data = head.toData();
    _spritePath = data.sprite;
    position = data.position;
    size = data.size;
  }

  late final String _spritePath;

  @override
  Future<void> onLoad() async {
    sprite = await gameRef.loadSprite(_spritePath);
  }
}
