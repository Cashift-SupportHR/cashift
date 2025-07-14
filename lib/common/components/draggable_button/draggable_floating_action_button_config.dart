import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DraggableFloatingActionButtonConfig extends StatefulWidget {

  final Widget child;
  final Offset initialOffset;
  final VoidCallback onPointerUp;
  final GlobalKey parentKey;

  const DraggableFloatingActionButtonConfig({Key? key,
    required this.child,
    required this.initialOffset,
    required this.onPointerUp,
    required this.parentKey,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DraggableFloatingActionButtonConfigState();
}

class _DraggableFloatingActionButtonConfigState extends State<DraggableFloatingActionButtonConfig> {

  final GlobalKey _key = GlobalKey();

  bool _isDragging = false;
  late Offset _offset;
  late Offset _minOffset;
  late Offset _maxOffset;

  @override
  void initState() {
    super.initState();
    _offset = widget.initialOffset;

    WidgetsBinding.instance.addPostFrameCallback(_setBoundary);
  }

  void _setBoundary(_) {
    final RenderBox parentRenderBox = widget.parentKey.currentContext?.findRenderObject() as RenderBox;
    final RenderBox renderBox = _key.currentContext?.findRenderObject() as RenderBox;

    try {
      final Size parentSize = parentRenderBox.size;
      final Size size = renderBox.size;

      setState(() {
        _minOffset = const Offset(0, 0);
        _maxOffset = Offset(
            parentSize.width - size.width,
            parentSize.height - size.height
        );
      });
    } catch (e) {
      if (kDebugMode) {
        print('catch: $e');
      }
    }
  }

  void _updatePosition(PointerMoveEvent pointerMoveEvent) {
    double newOffsetX = _offset.dx + pointerMoveEvent.delta.dx;
    double newOffsetY = _offset.dy + pointerMoveEvent.delta.dy;

    if (newOffsetX < _minOffset.dx) {
      newOffsetX = _minOffset.dx;
    } else if (newOffsetX > _maxOffset.dx) {
      newOffsetX = _maxOffset.dx;
    }

    if (newOffsetY < _minOffset.dy) {
      newOffsetY = _minOffset.dy;
    } else if (newOffsetY > _maxOffset.dy) {
      newOffsetY = _maxOffset.dy;
    }

    setState(() {
      _offset = Offset(newOffsetX, newOffsetY);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: _offset.dx,
      top: _offset.dy,
      child: Listener(
        onPointerMove: (PointerMoveEvent pointerMoveEvent) {
          _updatePosition(pointerMoveEvent);

          setState(() {
            _isDragging = true;
          });
        },
        onPointerUp: (PointerUpEvent pointerUpEvent) {
          if (kDebugMode) {
            print('onPointerUp');
          }

          if (_isDragging) {
            setState(() {
              _isDragging = false;
            });
          } else {
            widget.onPointerUp();
          }
        },
        child: Container(
          key: _key,
          padding: const EdgeInsetsDirectional.only(start: 30),
          child: widget.child,
        ),
      ),
    );
  }
}