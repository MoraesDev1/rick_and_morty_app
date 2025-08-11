import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/provider/providers.dart';
import 'package:rick_and_morty_app/core/widgets/layout/responsive_view_widget.dart';
import 'package:rick_and_morty_app/features/episode_detail/presentation/arguments/episode_detail_arguments.dart';
import 'package:rick_and_morty_app/features/episode_detail/presentation/view/phone/ph_episode_detail_view.dart';
import 'package:rick_and_morty_app/features/episode_detail/presentation/view/tablet/ta_episode_detail_view.dart';
import 'package:rick_and_morty_app/features/episode_detail/presentation/view/web/web_episode_detail_view.dart';
import 'package:rick_and_morty_app/features/episode_detail/presentation/viewmodel/episode_detail_viewmodel.dart';

class EpisodeDetailViewModule extends StatefulWidget {
  final EpisodeDetailArguments args;

  const EpisodeDetailViewModule({super.key, required this.args});

  @override
  State<EpisodeDetailViewModule> createState() => _EpisodeDetailViewModuleState();
}

class _EpisodeDetailViewModuleState extends State<EpisodeDetailViewModule> {
  late EpisodeDetailViewModel viewModel;
  @override
  void initState() {
    viewModel = getIt.get<EpisodeDetailViewModel>();
    viewModel.getEpisodeById(widget.args.episodeId);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ResponsiveViewWidget(
        phone: PhEpisodeDetailView(viewModel: viewModel), 
        tablet: TaEpisodeDetailView(),
        web: WebEpisodeDetailView(),
    );
  }
}