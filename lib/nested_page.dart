import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NestedPage extends StatelessWidget {
  final String label;
  const NestedPage({super.key, this.label = 'Nested Page'});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label),
          ElevatedButton(
            onPressed: () {
              switch (label) {
                case 'Nested Page A':
                  context.go('/nested-b');
                  break;
                case 'Nested Page B':
                  context.go('/nested-a');
                  break;
                default:
                  context.go('/');
                  break;
              }
            },
            child: Text(label == 'Nested Page A'
                ? 'Go to Nested Page B'
                : 'Go to Nested Page A'),
          ),
          ElevatedButton(
              onPressed: () {
                switch (label) {
                  case 'Nested Page A':
                    context.go('/nested-a/details');
                    break;
                  case 'Nested Page B':
                    context.go('/nested-b/details');
                    break;
                  default:
                    context.go('/');
                    break;
                }
              },
              child: const Text('Go to Details Page')),
          ElevatedButton(
              onPressed: () {
                context.go('/');
              },
              child: const Text('Go to Home Page'))
        ],
      ),
    );
  }
}
