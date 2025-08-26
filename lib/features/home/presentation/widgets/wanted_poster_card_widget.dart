import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/enum/assets_paths.dart';

class WantedPosterCardWidget extends StatelessWidget {
  final String imageUrl;
  final String name;
  final Function() onTap;

  const WantedPosterCardWidget({
    super.key, 
    required this.imageUrl,
    required this.name,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    imageUrl,
                    width: 80,
                    height: 140,
                    fit: BoxFit.cover,
                  ),
                ),
                Image.asset(
                  AssetsPaths.wantedFrame.path,
                  width: 150,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          Text(
            name.split(' ').first, 
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            name.split(' ').last, 
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}