import 'package:dwart/game/entities/entities.dart';
import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flame_behaviors/flame_behaviors.dart';

class DwarfSelectionBehavior extends Behavior<DwarfEntity> with Tappable {
  @override
  bool containsPoint(Vector2 point) {
    return parent.containsPoint(point);
  }

  @override
  bool onTapUp(TapUpInfo info) {
    print('yayyyy');
    return true;
  }
}
