import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/consts/app_strings.dart';
import 'package:rick_and_morty_app/core/entities/location_entity.dart';
import 'package:rick_and_morty_app/core/enum/named_routes.dart';
import 'package:rick_and_morty_app/features/home/presentation/widgets/top_location_card_widget.dart';
import 'package:rick_and_morty_app/features/location_detail/presentation/arguments/location_detail_arguments.dart';

class TopLocationsCarousel extends StatefulWidget {
  final List<LocationEntity> mostVisitedLocations;

  const TopLocationsCarousel({
    super.key,
    required this.mostVisitedLocations,
  });

  @override
  State<TopLocationsCarousel> createState() => _TopLocationsCarouselState();
}

class _TopLocationsCarouselState extends State<TopLocationsCarousel> {

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
                  Text(AppStrings.topLocations, style: Theme.of(context).textTheme.headlineMedium),
                ],
              ),
            ),
            CarouselSlider.builder(
              options: CarouselOptions(
                enableInfiniteScroll: true,
                padEnds: false,
                autoPlay: true,
                viewportFraction: 0.8,
                initialPage: 0,
                autoPlayInterval: const Duration(seconds: 8),
                height: 180,
              ),
              itemCount: widget.mostVisitedLocations.length,
              itemBuilder: (context, index, realIndex) {
                final location = widget.mostVisitedLocations[index];
                return TopLocationCardWidget(
                  name: location.name, 
                  type: location.type,
                  onTap: () {
                    Navigator.pushNamed(
                      context, 
                      AppNamedRoutes.locationsDetail.route,
                      arguments: LocationDetailArguments(locationId: location.id)
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}