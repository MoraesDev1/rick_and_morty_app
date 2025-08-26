import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/provider/providers.dart';
import 'package:rick_and_morty_app/core/widgets/layout/responsive_view_widget.dart';
import 'package:rick_and_morty_app/features/locations/presentation/view/phone/ph_locations_view.dart';
import 'package:rick_and_morty_app/features/locations/presentation/view/tablet/ta_locations_view.dart';
import 'package:rick_and_morty_app/features/locations/presentation/view/web/web_locations_view.dart';
import 'package:rick_and_morty_app/features/locations/presentation/viewmodel/locations_viewmodel.dart';

class LocationsViewModule extends StatefulWidget {
  const LocationsViewModule({super.key});

  @override
  State<LocationsViewModule> createState() => _LocationsViewModuleState();
}

class _LocationsViewModuleState extends State<LocationsViewModule> {
  late LocationsViewModel viewModel;
  @override
  void initState() {
    viewModel = getIt.get<LocationsViewModel>();
    viewModel.getAllLocations();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ResponsiveViewWidget(
        phone: PhLocationsView(viewModel: viewModel), 
        tablet: TaLocationsView(),
        web: WebLocationsView(),
    );
  }
}