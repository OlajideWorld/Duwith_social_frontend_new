import 'dart:async';
import 'package:flutter/material.dart';

/// A widget that calls [onLongHold] if the user presses & holds
/// for at least [holdDuration].
class HoldableWidget extends StatefulWidget {
  final Widget child;
  final Duration holdDuration;
  final VoidCallback onLongHold;

  const HoldableWidget({
    Key? key,
    required this.child,
    required this.onLongHold,
    this.holdDuration = const Duration(seconds: 3),
  }) : super(key: key);

  @override
  _HoldableWidgetState createState() => _HoldableWidgetState();
}

class _HoldableWidgetState extends State<HoldableWidget> {
  Timer? _holdTimer;

  void _startHoldTimer() {
    _holdTimer?.cancel();
    _holdTimer = Timer(widget.holdDuration, () {
      widget.onLongHold();
    });
  }

  void _cancelHoldTimer() {
    _holdTimer?.cancel();
    _holdTimer = null;
  }

  @override
  void dispose() {
    _cancelHoldTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _startHoldTimer(),
      onTapUp: (_) => _cancelHoldTimer(),
      onTapCancel: () => _cancelHoldTimer(),
      child: widget.child,
    );
  }
}
