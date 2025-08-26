import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/enum/assets_paths.dart';

class ImageWithFrame extends StatelessWidget {
  final String imageUrl;

  const ImageWithFrame({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 150,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipOval(
            child: Image.network(
              imageUrl,
              width: 144,
              height: 144,
              fit: BoxFit.cover,
            ),
          ),
          Transform.translate(
            offset: const Offset(0, 10),
            child: Transform.scale(
              scale: 1.5,
              child: Image.asset(
                AssetsPaths.frame.path,
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}