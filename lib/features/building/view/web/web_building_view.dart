import 'package:flutter/material.dart';

class WebBuildingView extends StatelessWidget {
  const WebBuildingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Building View - Web'),
      ),
      body: Center(
        child: Text(
          'This is the web version of the Building View.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}