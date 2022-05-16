import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';

/// {@template context_menu_item}
/// A model class that defines items to be rendered on a [ContextMenu].
/// {@endtemplate}
class ContextMenuItem {
  /// {@macro context_menu_item}
  ContextMenuItem({
    required this.onTap,
    required this.label,
  });

  /// Tap handler
  final VoidCallback onTap;

  /// Rendered label
  final String label;
}

/// {@template context_menu}
/// A component that renders a context menu.
/// {@endtemplate}
class ContextMenu extends PositionComponent with HasGameRef {
  /// {@macro dwarf_name_badge}
  ContextMenu({
    required this.items,
    Vector2? position,
  }) : super(position: position);

  /// Items of this menu.
  final List<ContextMenuItem> items;

  @override
  Future<void> onLoad() async {
    /// there can be only one
    gameRef.descendants().whereType<ContextMenu>().forEach((element) {
      element.removeFromParent();
    });
    final textRenderer = TextPaint(
      style: const TextStyle(
        fontSize: 28,
        color: Colors.black,
      ),
    );

    var textWidth = 0.0;
    var textHeight = 0.0;

    for (final item in items) {
      textHeight = max(textHeight, textRenderer.measureTextHeight(item.label));
      textWidth = max(textWidth, textRenderer.measureTextWidth(item.label));
    }

    for (var i = 0; i < items.length; i++) {
      unawaited(
        add(
          _ContextItemComponent(
            item: items[i],
            textWidth: textWidth,
            textHeight: textHeight,
            textRenderer: textRenderer,
            position: Vector2(0, textHeight * i),
          ),
        ),
      );
    }
  }
}

class _ContextItemComponent extends PositionComponent with Tappable {
  _ContextItemComponent({
    required this.item,
    required this.textWidth,
    required this.textHeight,
    required this.textRenderer,
    required Vector2 position,
  }) : super(position: position, size: Vector2(textWidth, textHeight));

  final ContextMenuItem item;
  final double textWidth;
  final double textHeight;
  final TextPaint textRenderer;

  @override
  bool onTapUp(TapUpInfo info) {
    parent?.removeFromParent();
    item.onTap();
    info.handled = true;
    return true;
  }

  @override
  Future<void> onLoad() async {
    final offset = Vector2(10, 8);
    await add(
      RectangleComponent(
        paint: Paint()..color = Colors.white,
        size: Vector2(width, height) + offset,
        children: [
          TextComponent(
            text: item.label,
            position: offset / 2,
            textRenderer: textRenderer,
          ),
        ],
      ),
    );
  }
}
