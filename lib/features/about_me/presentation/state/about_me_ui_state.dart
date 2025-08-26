

class AboutMeUiState {
  final bool isLoading;
  final String errorMessage;
  
  AboutMeUiState({
    required this.isLoading,
    required this.errorMessage,
  });

  factory AboutMeUiState.initial() {
    return AboutMeUiState(
      isLoading: false,
      errorMessage: '',
    );
  }

  AboutMeUiState copyWith({
    bool? isLoading,
    String? errorMessage,
  }) {
    return AboutMeUiState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}