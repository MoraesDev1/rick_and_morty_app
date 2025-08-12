import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/utils/extensions/string_extensions.dart';

class EpisodeChipWidget extends StatelessWidget {
  final String episode;
  final Function() onTap;

  const EpisodeChipWidget({super.key, required this.episode, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
            width: 1,
          ),
        ),
        width: 68,
        height: 40,
        child: Center(
          child: Text(
            'EP ${episode.getIdByUrl()}', 
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ),
    );
  }
}