import 'package:flame/components.dart';

/// {@tempalte dwarf_gear}
/// Basic model with gear information about a gear
/// {@endtemplate}
class DwarfGear {
  /// {@template dwarf_gear}
  DwarfGear({
    required this.sprite,
    required this.position,
    required this.size,
  });

  /// Gear sprite
  final String sprite;

  /// Gear position on the dwarf model
  final Vector2 position;

  /// Gear size on the dwarf model
  final Vector2 size;
}
