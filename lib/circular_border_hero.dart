library circular_border_hero;

import 'package:circular_border_hero/src/circular_border_transition.dart';
import 'package:flutter/material.dart';

class CircularBorderHero extends StatelessWidget {
  /// Create a hero which will animate to destination hero's radius.
  ///
  /// The [tag], [child] and [radius] parameters must not be null.
  /// The [child] parameter and all of the its descendants must not be [Hero]es.
  ///
  const CircularBorderHero(
      {Key key,
      @required this.tag,
      @required this.child,
      @required this.radius,
      this.createRectTween,
      this.placeholderBuilder,
      this.transitionOnUserGestures = false,
      this.flightShuttleBuilder})
      : super(key: key);

  /// Same as hero's tag.
  final Object tag;

  /// Same as hero's child.
  final Widget child;

  /// The child's circular border radius. it will animate radius to destination hero's radius during page transition.
  final double radius;

  /// Same as hero's createRectTween.
  final CreateRectTween createRectTween;

  /// Same as hero's placeholderBuilder.
  final HeroPlaceholderBuilder placeholderBuilder;

  /// Same as hero's transitionOnUserGestures.
  final bool transitionOnUserGestures;

  /// To override radius animation, provide a flightShuttleBuilder.
  final HeroFlightShuttleBuilder flightShuttleBuilder;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      createRectTween: createRectTween,
      placeholderBuilder: placeholderBuilder,
      transitionOnUserGestures: transitionOnUserGestures,
      flightShuttleBuilder: flightShuttleBuilder != null
          ? flightShuttleBuilder
          : (context, animation, direction, startContext, endContext) {
              double anotherHeroRadius = startContext
                  .findAncestorWidgetOfExactType<CircularBorderHero>()
                  .radius;
              Animation<double> radiusAnimation =
                  (direction == HeroFlightDirection.pop)
                      ? animation.drive<double>(
                          Tween(begin: radius, end: anotherHeroRadius))
                      : animation.drive<double>(
                          Tween(begin: anotherHeroRadius, end: radius));
              return CirularBorderTransition(
                animation: radiusAnimation,
                child: child,
              );
            },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: child,
      ),
    );
  }
}
