import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/consts/app_strings.dart';
import 'package:rick_and_morty_app/core/entities/character_entity.dart';
import 'package:rick_and_morty_app/core/enum/named_routes.dart';
import 'package:rick_and_morty_app/features/character_detail/presentation/arguments/character_detail_arguments.dart';
import 'package:rick_and_morty_app/features/home/presentation/widgets/wanted_poster_card_widget.dart';

class WantedCarousel extends StatefulWidget {
  final List<CharacterEntity> wantedCharacters;

  const WantedCarousel({
    super.key,
    required this.wantedCharacters,
  });

  @override
  State<WantedCarousel> createState() => _WantedCarouselState();
}

class _WantedCarouselState extends State<WantedCarousel> {

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(top: 0, bottom: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppStrings.wanted, style: Theme.of(context).textTheme.headlineMedium),
                ],
              ),
            ),
            CarouselSlider.builder(
              options: CarouselOptions(
                enableInfiniteScroll: true,
                padEnds: false,
                autoPlay: true,
                viewportFraction: 0.4,
                initialPage: 0,
                autoPlayInterval: const Duration(seconds: 8),
                height: 240,
              ),
              itemCount: widget.wantedCharacters.length,
              itemBuilder: (context, index, realIndex) {
                final character = widget.wantedCharacters[index];
                return WantedPosterCardWidget(
                  imageUrl: character.image,
                  name: character.name,
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      AppNamedRoutes.characterDetail.route,
                      arguments: CharacterDetailArguments(characterId: character.id),
                    );
                  }
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}