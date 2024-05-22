import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:master_flutter_30days_19/details_page.dart';
import 'package:master_flutter_30days_19/home_page.dart';
import 'package:master_flutter_30days_19/nested_page.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(navigatorKey: _rootNavigatorKey, routes: [
  GoRoute(
      path: '/',
      builder: (context, state) {
        return const HomePage();
      },
      routes: [
        GoRoute(
          path: 'details',
          builder: (context, state) {
            return const DetailsPage();
          },
        ),
        GoRoute(
          path: 'animation-details',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
                child: const DetailsPage(
                  label: 'Animation Details',
                ),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                      opacity: CurveTween(curve: Curves.easeInCirc)
                          .animate(animation),
                      child: child);
                });
          },
        ),
      ]),
  ShellRoute(
      builder: (context, state, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Nested Router Example'),
            backgroundColor: Theme.of(context).colorScheme.secondary,
            foregroundColor: Theme.of(context).colorScheme.onSecondary,
          ),
          body: child,
        );
      },
      routes: [
        GoRoute(
          path: '/nested-a',
          builder: (context, state) {
            return const NestedPage(
              label: 'Nested Page A',
            );
          },
          routes: [
            GoRoute(
              path: 'details',
              builder: (context, state) {
                return const DetailsPage(label: 'Nested Page A Details Page');
              },
            ),
          ],
        ),
        GoRoute(
          path: '/nested-b',
          builder: (context, state) {
            return const NestedPage(label: 'Nested Page B');
          },
          routes: [
            GoRoute(
              path: 'details',
              parentNavigatorKey: _rootNavigatorKey,
              builder: (context, state) {
                return const DetailsPage(label: 'Nested Page B Details Page');
              },
            ),
          ],
        )
      ])
]);
