import 'package:flutter/material.dart';

class TaBuildingView extends StatelessWidget {
  const TaBuildingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Building View'),
      ),
      body: Center(
        child: Text(
          'This is the Tablet Building View',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}