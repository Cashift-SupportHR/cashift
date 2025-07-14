import 'package:flutter/material.dart';

import 'draggable_floating_action_button_config.dart';

class DraggableButton extends StatelessWidget {
  final IconData? icon;
  final VoidCallback? onPressed;
  final Color? color;
  final Color? backgroundColor;
  final double? height;
  final double? width;
  final Offset? initialOffset;
  const DraggableButton({Key? key, this.icon, this.onPressed, this.color, this.height, this.width, this.initialOffset, this.backgroundColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey _parentKey = GlobalKey();

    return SizedBox(
      height: height ?? 80,
      child: Stack(
        key: _parentKey,
        children: [
          DraggableFloatingActionButtonConfig(
            child: FloatingActionButton(
              onPressed: onPressed,
              backgroundColor: backgroundColor,
              child: Icon(icon ?? Icons.add, color: color ),
            ),
            initialOffset: initialOffset ?? const Offset(0, 24),
            parentKey: _parentKey,
              onPointerUp: () {},
          ),
        ],
      ),
    );
  }
}
