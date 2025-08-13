enum AssetsPaths {
  loader('assets/images/portal.png'),
  failure('assets/images/morty_failure.png'),
  building('assets/images/building.png'),
  frame('assets/images/avatar_frame.png'),
  avatar('assets/images/avatar.png'),
  textBackgroundPurple('assets/images/text_background_purple.png'),
  textBackgroundGreen('assets/images/text_background_green.png'),
  speciesIcon('assets/icons/specie_icon.png'),
  genderIcon('assets/icons/gender_icon.png'),
  currentLocationIcon('assets/icons/current_location_icon.png'),
  originIcon('assets/icons/origin_icon.png');

  final String path;

  const AssetsPaths(this.path);
}