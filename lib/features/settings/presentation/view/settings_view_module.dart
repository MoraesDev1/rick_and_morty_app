import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/provider/providers.dart';
import 'package:rick_and_morty_app/core/widgets/layout/responsive_view_widget.dart';
import 'package:rick_and_morty_app/features/settings/presentation/view/phone/ph_settings_view.dart';
import 'package:rick_and_morty_app/features/settings/presentation/view/tablet/ta_settings_view.dart';
import 'package:rick_and_morty_app/features/settings/presentation/view/web/web_settings_view.dart';
import 'package:rick_and_morty_app/features/settings/presentation/viewmodel/settings_viewmodel.dart';

class SettingsViewModule extends StatefulWidget {
  const SettingsViewModule({super.key});

  @override
  State<SettingsViewModule> createState() => _SettingsViewModuleState();
}

class _SettingsViewModuleState extends State<SettingsViewModule> {
  late SettingsViewModel viewModel;
  @override
  void initState() {
    viewModel = getIt.get<SettingsViewModel>();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ResponsiveViewWidget(
        phone: PhSettingsView(viewModel: viewModel), 
        tablet: TaSettingsView(),
        web: WebSettingsView(),
    );
  }
}