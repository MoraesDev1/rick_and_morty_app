enum AssetsPaths {
  loader('assets/images/portal.png'),
  failure('assets/images/morty_failure.png'),
  building('assets/images/building.png'),
  avatar('assets/images/avatar.png');

  final String path;

  const AssetsPaths(this.path);
}