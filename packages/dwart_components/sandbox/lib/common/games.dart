import 'package:flame/components.dart';
import 'package:flame/game.dart';

class SandboxGame extends FlameGame {
  SandboxGame() {
    images.prefix = '';
  }
}

class SingleComponentGame extends SandboxGame {
  SingleComponentGame(this.component);

  final Component component;

  @override
  Future<void> onLoad() async {
    camera.followVector2(Vector2.zero());

    await add(component);
  }
}
