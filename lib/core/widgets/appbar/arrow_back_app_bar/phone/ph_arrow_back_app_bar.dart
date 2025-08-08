import 'package:flutter/material.dart';

class PhArrowBackAppBar extends StatelessWidget {
  final String? title;

  const PhArrowBackAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      title: Text(title ?? ''),
      centerTitle: true,
    );
  }
}