import 'package:flutter/cupertino.dart';
import 'package:rick_and_morty_app/features/settings/presentation/state/settings_ui_state.dart';

class SettingsViewModel extends ValueNotifier<SettingsUiState>{

  SettingsViewModel()
  : super(SettingsUiState.initial());

  void changeLoading(bool isLoading) {
    value = value.copyWith(isLoading: isLoading);
  }

  void clearErrorMessage() {
    value = value.copyWith(errorMessage: '');
  }
}