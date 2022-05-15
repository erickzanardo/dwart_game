import 'package:flame/components.dart';

/// A mixin that informs that the a [PositionComponent] is walkable by
/// characters.
mixin Walkable on PositionComponent {
  /// The list of paths that this [Walkable] provides.
  /// Each [Vector2] represents a relative index based on this
  /// component size.
  List<Vector2> toPaths();

  /// If the component itself is full solid or not.
  bool get solid;
}
