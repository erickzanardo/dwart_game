import 'package:dwart_components/dwart_components.dart';
import 'package:dwart_components/gen/assets.gen.dart';
import 'package:flame/components.dart';

/// List of face gears
enum FaceGear {
  /// No gear
  none,

  /// Blacksmith googles
  blacksmithGoogles,
}

/// Add mapping helpers to [FaceGear]
extension FaceGearX on FaceGear {
  /// Return the data of this gear
  DwarfGear toData() {
    switch (this) {
      case FaceGear.none:
        return DwarfGear(
          sprite: Assets.images.dwarf.face.keyName,
          position: Vector2(40.9, 5.4),
          size: Vector2(59.4, 125.3),
        );
      case FaceGear.blacksmithGoogles:
        return DwarfGear(
          sprite: Assets.images.dwarf.blacksmithGooglesFace.keyName,
          position: Vector2(40.9, 5.4),
          size: Vector2(59.8, 133.5),
        );
    }
  }
}

/// {@template dwarf_face}
/// The face of a [Dwarf]
/// {@endtemplate}
class DwarfFace extends SpriteComponent with HasGameRef {
  /// {@macro dwarf_face}
  DwarfFace({ required FaceGear face}) : super(priority: 4) {
    final data = face.toData();
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
