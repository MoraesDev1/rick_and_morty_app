import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/widgets/drawer/app_drawer.dart';

import '../../enum/device_type.dart';

class ResponsiveViewWidget extends StatelessWidget {
  final Widget phone;
  final Widget tablet;
  final Widget web;

  const ResponsiveViewWidget({
    super.key,
    required this.phone,
    required this.tablet,
    required this.web,
  });

  String _getBackgroundAsset(DeviceType deviceType, bool isDarkMode) {
    final theme = isDarkMode ? 'dark' : 'light';

    switch (deviceType) {
      case DeviceType.phone:
        return 'assets/images/backgrounds/$theme/ph_background.png';
      case DeviceType.tablet:
        return 'assets/images/backgrounds/$theme/ta_background.png';
      case DeviceType.web:
        return 'assets/images/backgrounds/$theme/web_background.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        drawer: const AppDrawer(),
        body: LayoutBuilder(
          builder: (context, constraints) {
            final DeviceType deviceType = DeviceType.fromDimensions(constraints.maxWidth, constraints.maxHeight);

            final String backgroundAsset = _getBackgroundAsset(deviceType, isDarkMode);

            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(backgroundAsset),
                  fit: BoxFit.cover,
                ),
              ),
              child: switch (deviceType) {
                DeviceType.phone => phone,
                DeviceType.tablet => tablet,
                DeviceType.web => web,
              },
            );
          },
        ),
      ),
    );
  }
}