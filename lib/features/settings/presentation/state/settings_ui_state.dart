class SettingsUiState {
  final bool isLoading;
  final String errorMessage;
  
  SettingsUiState({
    required this.isLoading,
    required this.errorMessage,
  });

  factory SettingsUiState.initial() {
    return SettingsUiState(
      isLoading: false,
      errorMessage: '',
    );
  }

  SettingsUiState copyWith({
    bool? isLoading,
    String? errorMessage,
  }) {
    return SettingsUiState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}