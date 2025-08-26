import 'package:flutter/cupertino.dart';
import 'package:rick_and_morty_app/features/about_me/presentation/state/about_me_ui_state.dart';

class AboutMeViewModel extends ValueNotifier<AboutMeUiState>{

  AboutMeViewModel()
  : super(AboutMeUiState.initial());

  void changeLoading(bool isLoading) {
    value = value.copyWith(isLoading: isLoading);
  }

  void clearErrorMessage() {
    value = value.copyWith(errorMessage: '');
  }
}