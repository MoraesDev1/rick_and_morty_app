import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/consts/app_strings.dart';
import 'package:rick_and_morty_app/core/enum/assets_paths.dart';

class GenericAlertWidget extends StatelessWidget {
  final String message;

  const GenericAlertWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(AppStrings.warning, textAlign: TextAlign.center),
      content: Column(
        spacing: 24,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            AssetsPaths.failure.path,
            height: 180,
            width: 180,
          ),
          Text(message, textAlign: TextAlign.center),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(AppStrings.ok),
        ),
      ],
    );
  }
}