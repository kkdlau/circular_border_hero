import 'package:flutter/material.dart';

class CirularBorderTransition extends AnimatedWidget {
  /// Create an animated widget which can animate widget circular border.
  ///
  /// [child] and [listenable] parameters must not be null.
  ///
  const CirularBorderTransition(
      {Key key, this.child, Animation<double> animation})
      : super(key: key, listenable: animation);

  @required
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return ClipRRect(
      child: child,
      borderRadius: BorderRadius.circular(animation.value),
    );
  }
}
