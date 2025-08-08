import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/widgets/layout/responsive_view_widget.dart';
import 'package:rick_and_morty_app/features/building/view/phone/ph_building_view.dart';
import 'package:rick_and_morty_app/features/building/view/tablet/ta_building_view.dart';
import 'package:rick_and_morty_app/features/building/view/web/web_building_view.dart';

class BuildingViewModule extends StatelessWidget {
  const BuildingViewModule({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveViewWidget(
      phone: PhBuildingView(), 
      tablet: TaBuildingView(), 
      web: WebBuildingView(),
    );
  }
}