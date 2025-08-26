import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/widgets/alerts/generic_alert_widget.dart';
import 'package:rick_and_morty_app/core/widgets/appbar/main_app_bar/phone/ph_main_app_bar.dart';
import 'package:rick_and_morty_app/core/widgets/loader/full_screen_loader.dart';
import 'package:rick_and_morty_app/features/about_me/presentation/viewmodel/about_me_viewmodel.dart';

class PhAboutMeView extends StatelessWidget {
  final AboutMeViewModel viewModel;

  const PhAboutMeView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: viewModel, 
      builder: (context, value, child) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (value.errorMessage.isNotEmpty) {
            showDialog(
              context: context, 
              builder: (_) => GenericAlertWidget(message: value.errorMessage),
            ).then(
              (_) => viewModel.clearErrorMessage(),
            );
          }
        });
        return Column(
          children: [
            PhMainAppBar(title: AppStrings.aboutMe),
            value.isLoading
            ? const FullScreenLoader()
            : Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(),
                ),
              ),
          ],
        );
      },
    );
  }
}