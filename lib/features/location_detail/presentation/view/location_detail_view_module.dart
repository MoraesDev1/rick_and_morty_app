import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/provider/providers.dart';
import 'package:rick_and_morty_app/core/widgets/layout/responsive_view_widget.dart';
import 'package:rick_and_morty_app/features/location_detail/presentation/arguments/location_detail_arguments.dart';
import 'package:rick_and_morty_app/features/location_detail/presentation/view/phone/ph_location_detail_view.dart';
import 'package:rick_and_morty_app/features/location_detail/presentation/view/tablet/ta_location_detail_view.dart';
import 'package:rick_and_morty_app/features/location_detail/presentation/view/web/web_location_detail_view.dart';
import 'package:rick_and_morty_app/features/location_detail/presentation/viewmodel/location_detail_viewmodel.dart';

class LocationDetailViewModule extends StatefulWidget {
  final LocationDetailArguments args;

  const LocationDetailViewModule({super.key, required this.args});

  @override
  State<LocationDetailViewModule> createState() => _LocationDetailViewModuleState();
}

class _LocationDetailViewModuleState extends State<LocationDetailViewModule> {
  late LocationDetailViewModel viewModel;
  @override
  void initState() {
    viewModel = getIt.get<LocationDetailViewModel>();
    viewModel.init(widget.args.locationId);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ResponsiveViewWidget(
        phone: PhLocationDetailView(viewModel: viewModel), 
        tablet: TaLocationDetailView(),
        web: WebLocationDetailView(),
    );
  }
}