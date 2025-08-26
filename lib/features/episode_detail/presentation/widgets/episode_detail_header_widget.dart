import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/consts/app_strings.dart';
import 'package:rick_and_morty_app/core/consts/url_mocks.dart';

class EpisodeDetailHeaderWidget extends StatelessWidget {
  final String name;
  final String episode;
  final String airDate;

  const EpisodeDetailHeaderWidget({super.key, required this.name, required this.episode, required this.airDate});

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
              image: NetworkImage(UrlMocks.episodeDefault),
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
          '${AppStrings.episode}: $episode',
          style: Theme.of(context).textTheme.titleMedium,
          textAlign: TextAlign.center,
        ),
        Text(
          '${AppStrings.airDate}: $airDate',
          style: Theme.of(context).textTheme.titleMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}