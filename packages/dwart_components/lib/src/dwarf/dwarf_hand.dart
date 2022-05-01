import 'package:dwart_components/dwart_components.dart';
import 'package:dwart_components/gen/assets.gen.dart';
import 'package:flame/components.dart';

/// List of hand gears
enum HandGear {
  /// Bare hands
  none,

  /// Blacksmith gloves
  blacksmithGloves,
}

/// Add mapping helpers to [HandGear]
extension HandGearX on HandGear {
  /// Return the data of this gear
  DwarfGear toData() {
    switch (this) {
      case HandGear.none:
        return DwarfGear(
          sprite: Assets.images.dwarf.hand.keyName,
          position: Vector2.zero(),
          size: Vector2.all(30.8),
        );
      case HandGear.blacksmithGloves:
        return DwarfGear(
          sprite: Assets.images.dwarf.blacksmithGlooves.keyName,
          position: Vector2.zero(),
          size: Vector2.all(30.8),
        );
    }
  }
}

/// {@template dwarf_hand}
/// The hand of a [Dwarf]
/// {@endtemplate}
class DwarfHand extends SpriteComponent with HasGameRef {
  /// {@macro dwarf_hand}
  DwarfHand.left(HandGear hand) {
    final data = hand.toData();
    position = Vector2(93.3, 73.3) + data.position;
    size = data.size;
    priority = 0;
    _spritePath = data.sprite;
  }

  /// {@macro dwarf_hand}
  DwarfHand.right(HandGear hand) {
    final data = hand.toData();
    position = Vector2(22.3, 70.3) + data.position;
    size = data.size;
    priority = 3;
    _spritePath = data.sprite;
  }

  late final String _spritePath;

  @override
  Future<void> onLoad() async {
    sprite = await gameRef.loadSprite(_spritePath);
  }
}
