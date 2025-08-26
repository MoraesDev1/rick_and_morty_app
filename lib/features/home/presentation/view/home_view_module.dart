import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/provider/providers.dart';
import 'package:rick_and_morty_app/core/widgets/layout/responsive_view_widget.dart';
import 'package:rick_and_morty_app/features/home/presentation/view/phone/ph_home_view.dart';
import 'package:rick_and_morty_app/features/home/presentation/view/tablet/ta_home_view.dart';
import 'package:rick_and_morty_app/features/home/presentation/view/web/web_home_view.dart';
import 'package:rick_and_morty_app/features/home/presentation/viewmodel/home_viewmodel.dart';

class HomeViewModule extends StatefulWidget {
  const HomeViewModule({super.key});

  @override
  State<HomeViewModule> createState() => _HomeViewModuleState();
}

class _HomeViewModuleState extends State<HomeViewModule> {
  late HomeViewModel homeViewModel;
  @override
  void initState() {
    homeViewModel = getIt.get<HomeViewModel>();
    homeViewModel.init();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ResponsiveViewWidget(
        phone: PhHomeView(homeViewModel: homeViewModel), 
        tablet: TaHomeView(),
        web: WebHomeView(),
    );
  }
}