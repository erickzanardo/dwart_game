import 'package:dashbook/dashbook.dart';
import 'package:dwart_components/dwart_components.dart';
import 'package:flame/game.dart';
import 'package:sandbox/stories/dwarf/basic.dart';

void addDwarfStories(Dashbook dashbook) {
  dashbook.storiesOf('Dwarf').add(
        'Basic',
        (context) => GameWidget(
          game: BasicDwarfGame(
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
          ),
        ),
        info: BasicDwarfGame.info,
      );
}
