import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/consts/app_strings.dart';
import 'package:rick_and_morty_app/core/consts/url_mocks.dart';

class LocationDetailHeaderWidget extends StatelessWidget {
  final String name;
  final String type;
  final String dimension;

  const LocationDetailHeaderWidget({super.key, required this.name, required this.type, required this.dimension});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      children: [
        SizedBox(
          height: 160,
          width: 260,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image(
              image: NetworkImage(UrlMocks.locationDefault),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Text(
          name,
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
        Text(
          '${AppStrings.type}: $type',
          style: Theme.of(context).textTheme.titleMedium,
          textAlign: TextAlign.center,
        ),
        Text(
          '${AppStrings.dimension}: $dimension',
          style: Theme.of(context).textTheme.titleMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}