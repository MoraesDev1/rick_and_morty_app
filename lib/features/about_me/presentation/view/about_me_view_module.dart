import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/provider/providers.dart';
import 'package:rick_and_morty_app/core/widgets/layout/responsive_view_widget.dart';
import 'package:rick_and_morty_app/features/about_me/presentation/view/phone/ph_about_me_view.dart';
import 'package:rick_and_morty_app/features/about_me/presentation/view/tablet/ta_about_me_view.dart';
import 'package:rick_and_morty_app/features/about_me/presentation/view/web/web_about_me_view.dart';
import 'package:rick_and_morty_app/features/about_me/presentation/viewmodel/about_me_viewmodel.dart';

class AboutMeViewModule extends StatefulWidget {
  const AboutMeViewModule({super.key});

  @override
  State<AboutMeViewModule> createState() => _AboutMeViewModuleState();
}

class _AboutMeViewModuleState extends State<AboutMeViewModule> {
  late AboutMeViewModel viewModel;
  @override
  void initState() {
    viewModel = getIt.get<AboutMeViewModel>();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ResponsiveViewWidget(
        phone: PhAboutMeView(viewModel: viewModel), 
        tablet: TaAboutMeView(),
        web: WebAboutMeView(),
    );
  }
}