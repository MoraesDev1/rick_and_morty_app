import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/consts/app_strings.dart';
import 'package:rick_and_morty_app/core/enum/assets_paths.dart';
import 'package:rick_and_morty_app/core/widgets/appbar/main_app_bar/phone/ph_main_app_bar.dart';

class PhBuildingView extends StatefulWidget {
  const PhBuildingView({super.key});

  @override
  State<PhBuildingView> createState() => _PhBuildingViewState();
}

class _PhBuildingViewState extends State<PhBuildingView> {
  final List<String> _messages = [
    AppStrings.buildingMessage1,
    AppStrings.buildingMessage2,
    AppStrings.buildingMessage3,
    AppStrings.buildingMessage4,
    AppStrings.buildingMessage5,
    AppStrings.buildingMessage6,
    AppStrings.buildingMessage7,
    AppStrings.buildingMessage8,
    AppStrings.buildingMessage9,
    AppStrings.buildingMessage10,
  ];

  final Random _random = Random();
  late String _currentMessage;
  int? _lastIndex;
  Timer? _messageTimer;

  @override
  void initState() {
    super.initState();
    _setRandomMessage();

    _messageTimer = Timer.periodic(const Duration(seconds: 5), (_) {
      _setRandomMessage();
    });
  }

  void _setRandomMessage() {
    int newIndex;

    do {
      newIndex = _random.nextInt(_messages.length);
    } while (newIndex == _lastIndex && _messages.length > 1);

    setState(() {
      _lastIndex = newIndex;
      _currentMessage = _messages[newIndex];
    });
  }

  @override
  void dispose() {
    _messageTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PhMainAppBar(title: AppStrings.building),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AssetsPaths.building.path,
                height: MediaQuery.sizeOf(context).height * .4,
                width: MediaQuery.sizeOf(context).width * .6,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 56),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 800),
                  child: Text(
                    _currentMessage,
                    key: ValueKey(_currentMessage),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelLarge,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}