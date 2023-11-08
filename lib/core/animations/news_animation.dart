import 'package:flutter/cupertino.dart';

class NewsAnimation extends PageRouteBuilder {
  final page;

  NewsAnimation({this.page})
      : super(
            pageBuilder: (context, animation, animation2) => page,
            transitionsBuilder: (context, animation, animation2, child) {
              return RotationTransition(
                turns: animation,
                child: FadeTransition(
                  opacity: animation,
                  child: child,
                ),
              );
            });
}
