import 'package:flame/components.dart';
import 'package:flutter/material.dart';

/// {@template dwarf_name_badge}
/// A simple [TextComponent] used to display a dwarf name.
/// {@endtemplate}
class DwarfNameBadge extends PositionComponent {
  /// {@macro dwarf_name_badge}
  DwarfNameBadge({
    required this.text,
    Vector2? position,
  }) : super(position: position);

  /// Text shown
  final String text;

  @override
  Future<void> onLoad() async {
    final textRenderer = TextPaint(
      style: const TextStyle(
        fontSize: 28,
        color: Colors.lightBlue,
      ),
    );
    final textWidth = textRenderer.measureTextWidth(text);
    final textHeight = textRenderer.measureTextHeight(text);

    final offset = Vector2(10, 8);

    await add(
      RectangleComponent(
        paint: Paint()..color = Colors.deepPurpleAccent,
        size: Vector2(textWidth, textHeight) + offset,
        anchor: Anchor.center,
        children: [
          TextComponent(
            text: text,
            position: offset / 2,
            textRenderer: textRenderer,
          ),
        ],
      ),
    );
  }
}
