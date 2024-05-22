import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  context.go('/details');
                },
                child: const Text('Go to Details Page')),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  context.go('/animation-details');
                },
                child: const Text('Go to Animation Details Page')),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  context.go('/nested-a');
                },
                child: const Text('Go to Nested Page A')),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  context.go('/nested-b');
                },
                child: const Text('Go to Nested Page B')),
          ],
        ),
      ),
    );
  }
}
