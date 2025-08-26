import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/consts/url_mocks.dart';
import 'package:rick_and_morty_app/core/enum/assets_paths.dart';

class TopLocationCardWidget extends StatelessWidget {
  final String name;
  final String type;
  final Function() onTap;

  const TopLocationCardWidget({super.key, required this.name, required this.type, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 180,
          child: Stack(
            children: [
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    UrlMocks.locationDefault,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
                  ),
                ),
              ),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.center,
                      colors: [
                        Theme.of(context).colorScheme.primary,
                        Theme.of(context).colorScheme.primary.withAlpha(20),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * .8,
                child: Padding(
                  padding: const EdgeInsets.only(left: 0, right: 8, bottom: 8, top: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Positioned.fill(
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(bottomRight: Radius.circular(12), topRight: Radius.circular(12)),
                              child: Image(
                                image: AssetImage(AssetsPaths.textBackgroundPurple.path), 
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Text(name, style: Theme.of(context).textTheme.titleMedium, maxLines: 1, overflow: TextOverflow.ellipsis),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}