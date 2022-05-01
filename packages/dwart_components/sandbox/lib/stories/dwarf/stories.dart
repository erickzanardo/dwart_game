import 'package:dashbook/dashbook.dart';
import 'package:dwart_components/dwart_components.dart';
import 'package:flame/game.dart';
import 'package:sandbox/common/common.dart';

void addDwarfStories(Dashbook dashbook) {
  dashbook.storiesOf('Dwarf').add(
    'Basic',
    (context) {
      final dwarf = Dwarf(
        position: Vector2.zero(),
        headGear: context.listProperty(
          'headGear',
          HeadGear.basic,
          HeadGear.values,
        ),
        rightHandGear: context.listProperty(
          'rightHandGear',
          HandGear.none,
          HandGear.values,
        ),
        leftHandGear: context.listProperty(
          'leftHandGear',
          HandGear.none,
          HandGear.values,
        ),
        bodyGear: context.listProperty(
          'bodyGear',
          BodyGear.none,
          BodyGear.values,
        ),
        faceGear: context.listProperty(
          'faceGear',
          FaceGear.none,
          FaceGear.values,
        ),
        rightHandTool: context.listProperty(
          'rightHandTool',
          null,
          [null, ...HandTool.values],
        ),
        leftHandTool: context.listProperty(
          'leftHandTool',
          null,
          [null, ...HandTool.values],
        ),
      );

      context
        ..action('Swing right hand', (_) {
          dwarf.swingHand(HandType.right);
        })
        ..action('Swing left hand', (_) {
          dwarf.swingHand(HandType.left);
        });

      return GameWidget(
        game: SingleComponentGame(
          dwarf,
        ),
      );
    },
  );
}
