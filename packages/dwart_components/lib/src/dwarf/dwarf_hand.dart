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

/// List of hand tools
enum HandTool {
  /// Pickaxe
  pickaxe,

  /// Hammer
  hammer,

  /// Tongs
  tongs,
}

/// Add mapping helpers to [HandTool]
extension HandToolX on HandTool {
  /// Return the data of this gear
  DwarfGear toData() {
    switch (this) {
      case HandTool.pickaxe:
        return DwarfGear(
          sprite: Assets.images.dwarf.pickaxe.keyName,
          position: Vector2.zero(),
          size: Vector2(106.9, 118),
          angle: 1.2,
          anchor: const Anchor(0.3, 0.9),
        );
      case HandTool.hammer:
        return DwarfGear(
          sprite: Assets.images.dwarf.hammer.keyName,
          position: Vector2.zero(),
          size: Vector2(51.9, 98.3),
          angle: 0.2,
          anchor: const Anchor(0.2, 0.6),
        );
      case HandTool.tongs:
        return DwarfGear(
          sprite: Assets.images.dwarf.tongs.keyName,
          position: Vector2(2.5, 0),
          size: Vector2(21.6, 73.7),
          anchor: Anchor.centerLeft,
        );
    }
  }
}

/// {@template dwarf_hand_tool}
/// The tool part of the [DwarfHand]
/// {@endtemplate}
class DwarfHandTool extends SpriteComponent with HasGameRef {
  /// {@macro dwarf_hand_tool}
  DwarfHandTool(HandTool tool) {
    final data = tool.toData();
    position = data.position;
    size = data.size;
    priority = 0;
    anchor = data.anchor;
    angle = data.angle;
    _spritePath = data.sprite;
  }

  late final String _spritePath;

  @override
  Future<void> onLoad() async {
    sprite = await gameRef.loadSprite(_spritePath);
  }
}

/// {@template dwarf_hand_gear}
/// The gear part of the [DwarfHand]
/// {@endtemplate}
class DwarfHandGear extends SpriteComponent with HasGameRef {
  /// {@macro dwarf_hand_gear}
  DwarfHandGear(HandGear hand) {
    final data = hand.toData();
    position = data.position;
    size = data.size;
    priority = 1;
    _spritePath = data.sprite;
  }

  late final String _spritePath;

  @override
  Future<void> onLoad() async {
    sprite = await gameRef.loadSprite(_spritePath);
  }
}

/// {@template dwarf_hand}
/// The hand of a [Dwarf]
/// {@endtemplate}
class DwarfHand extends PositionComponent with HasGameRef {
  /// {@macro dwarf_hand}
  DwarfHand.left(HandGear hand, [HandTool? tool])
      : super(
          position: Vector2(93.3, 73.3),
          priority: 0,
          children: [
            if (tool != null) DwarfHandTool(tool),
            DwarfHandGear(hand),
          ],
        );

  /// {@macro dwarf_hand}
  DwarfHand.right(HandGear hand, [HandTool? tool])
      : super(
          position: Vector2(22.3, 70.3),
          priority: 5,
          children: [
            if (tool != null) DwarfHandTool(tool),
            DwarfHandGear(hand),
          ],
        );
}
