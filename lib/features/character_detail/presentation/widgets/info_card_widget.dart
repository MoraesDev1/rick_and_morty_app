import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/consts/app_strings.dart';

class InfoCardWidget extends StatelessWidget {
  final String titleLabel;
  final String titleValue;
  final String type;
  final String iconPath;

  const InfoCardWidget({
    super.key, 
    required this.titleLabel, 
    required this.titleValue, 
    required this.type,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 1,
          )
        ),
        child: Padding(padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                iconPath,
                width: 40,
                height: 40,
                errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.image_not_supported_outlined,
                  size: 40,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      titleLabel,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      titleValue,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                ),
              ),
              if (type.isNotEmpty) Tooltip(
                triggerMode: TooltipTriggerMode.tap,
                enableTapToDismiss: true,
                waitDuration: Duration(seconds: 1),
                message: '${AppStrings.type}: $type',
                child: Icon(
                  Icons.info_outline,
                  size: 24,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}