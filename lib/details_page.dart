import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailsPage extends StatelessWidget {
  final String label;
  const DetailsPage({super.key, this.label = 'Details Page'});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(label),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              context.pop();
            },
            child: const Text('Go back'),
          ),
        ));
  }
}
