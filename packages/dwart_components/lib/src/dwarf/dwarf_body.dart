import 'package:dwart_components/dwart_components.dart';
import 'package:dwart_components/gen/assets.gen.dart';
import 'package:flame/components.dart';

/// List of body gears
enum BodyGear {
  /// No gear
  none,
  /// Blacksmith appron
  blacksmithAppron,
}

/// Add mapping helpers to [BodyGear]
extension BodyGearX on BodyGear {
  /// Return the data of this gear
  DwarfGear toData() {
    switch (this) {
      case BodyGear.none:
        return DwarfGear(
            sprite: Assets.images.dwarf.body.keyName,
            position: Vector2(6.4, 0),
            size: Vector2(98, 145.3),
        );
      case BodyGear.blacksmithAppron:
        return DwarfGear(
            sprite: Assets.images.dwarf.blacksmithApron.keyName,
            position: Vector2(6.4, 0),
            size: Vector2(98, 145.3),
        );
    }
  }
}

/// {@template dwarf_body}
/// The body of a [Dwarf]
/// {@endtemplate}
class DwarfBody extends SpriteComponent with HasGameRef {
  /// {@macro dwarf_body}
  DwarfBody({ required BodyGear body}) : super(priority: 1) {
    final data = body.toData();
    position = data.position;
    size = data.size;
    _spritePath = data.sprite;
  }

  late final String _spritePath;

  @override
  Future<void> onLoad() async {
    sprite = await gameRef.loadSprite(_spritePath);
  }
}
