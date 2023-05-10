import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TransitionPage extends CustomTransitionPage {
  TransitionPage({required GoRouterState state, required Widget child})
      : super(
          key: state.pageKey,
          child: child,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.ease;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 200),
        );
}
