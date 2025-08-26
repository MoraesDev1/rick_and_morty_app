import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/provider/providers.dart';
import 'package:rick_and_morty_app/core/widgets/layout/responsive_view_widget.dart';
import 'package:rick_and_morty_app/features/episodes/presentation/view/phone/ph_episodes_view.dart';
import 'package:rick_and_morty_app/features/episodes/presentation/view/tablet/ta_episodes_view.dart';
import 'package:rick_and_morty_app/features/episodes/presentation/view/web/web_episodes_view.dart';
import 'package:rick_and_morty_app/features/episodes/presentation/viewmodel/episodes_viewmodel.dart';

class EpisodesViewModule extends StatefulWidget {
  const EpisodesViewModule({super.key});

  @override
  State<EpisodesViewModule> createState() => _EpisodesViewModuleState();
}

class _EpisodesViewModuleState extends State<EpisodesViewModule> {
  late EpisodesViewModel viewModel;
  @override
  void initState() {
    viewModel = getIt.get<EpisodesViewModel>();
    viewModel.getAllEpisodes();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ResponsiveViewWidget(
        phone: PhEpisodesView(viewModel: viewModel), 
        tablet: TaEpisodesView(),
        web: WebEpisodesView(),
    );
  }
}