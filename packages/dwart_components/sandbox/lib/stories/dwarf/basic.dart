import 'package:dwart_components/dwart_components.dart';
import 'package:flame/components.dart';
import 'package:sandbox/common/common.dart';

class BasicDwarfGame extends SandboxGame {
  BasicDwarfGame({
    required this.headGear,
    required this.rightHandGear,
    required this.leftHandGear,
    required this.bodyGear,
    required this.faceGear,
  });

  static const info = '''
      Example with a single dwarf rendered
  ''';

  HeadGear headGear;
  HandGear leftHandGear;
  HandGear rightHandGear;
  BodyGear bodyGear;
  FaceGear faceGear;

  @override
  Future<void> onLoad() async {
    camera.followVector2(Vector2.zero());

    await add(
      Dwarf(
        position: Vector2.zero(),
        headGear: headGear,
        rightHandGear: rightHandGear,
        leftHandGear: leftHandGear,
        bodyGear: bodyGear,
        faceGear: faceGear,
      ),
    );
  }
}
