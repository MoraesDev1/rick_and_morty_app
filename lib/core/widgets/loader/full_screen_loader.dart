import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/enum/assets_paths.dart';

import '../../consts/app_strings.dart';

class FullScreenLoader extends StatefulWidget {
  const FullScreenLoader({super.key});

  @override
  State<FullScreenLoader> createState() => _FullScreenLoaderState();
}

class _FullScreenLoaderState extends State<FullScreenLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<String> _messages = [
    AppStrings.loadingMessage1,
    AppStrings.loadingMessage2,
    AppStrings.loadingMessage3,
    AppStrings.loadingMessage4,
    AppStrings.loadingMessage5,
    AppStrings.loadingMessage6,
    AppStrings.loadingMessage7,
    AppStrings.loadingMessage8,
    AppStrings.loadingMessage9,
    AppStrings.loadingMessage10,
  ];

  final Random _random = Random();
  late String _currentMessage;
  int? _lastIndex;
  Timer? _messageTimer;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();

    _setRandomMessage();
    
    _messageTimer = Timer.periodic(const Duration(seconds: 3), (_) {
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
    _controller.dispose();
    _messageTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RotationTransition(
              turns: _controller,
              child: Image.asset(
                AssetsPaths.loader.path,
                width: 120,
                height: 120,
                errorBuilder: (context, error, stackTrace) => const SizedBox(
                  width: 120,
                  height: 120,
                  child: Center(child: CircularProgressIndicator()),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 56),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: Text(
                  _currentMessage,
                  key: ValueKey(_currentMessage),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
