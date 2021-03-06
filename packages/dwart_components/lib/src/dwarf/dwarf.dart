import 'package:dwart_components/dwart_components.dart';
import 'package:flame/components.dart';

/// {@template dwarf}
/// The component to render a dwarf character
/// {@endtemplate}
class Dwarf extends PositionComponent {
  /// {@macro dwarf}
  Dwarf({
    Vector2? position,
    HeadGear headGear = HeadGear.basic,
    HandGear rightHandGear = HandGear.none,
    HandGear leftHandGear = HandGear.none,
    BodyGear bodyGear = BodyGear.none,
    FaceGear faceGear = FaceGear.none,
    HandTool? rightHandTool,
    HandTool? leftHandTool,
  }) : super(
          position: position,
          size: Vector2(124.1, 154.2),
          children: [
            DwarfHand.right(rightHandGear, rightHandTool),
            DwarfBody(body: bodyGear),
            DwarfFace(face: faceGear),
            DwarfHand.left(leftHandGear, leftHandTool),
            DwarfHat(head: headGear),
          ],
        );

  /// Makes the dwarf swing its hand
  void swingHand(HandType hand) {
    children
        .whereType<DwarfHand>()
        .firstWhere((dwarfHand) => dwarfHand.type == hand)
        .swing();
  }
}
