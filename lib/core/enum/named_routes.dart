enum AppNamedRoutes {
  aboutMe('/aboutMe'),
  building('/building'),
  home('/home'),
  characters('/characters'),
  episodes('/episodes'),
  locations('/locations'),
  characterDetail('/characterDetail'),
  episodesDetail('/episodesDetail'),
  locationsDetail('/locationsDetail'),
  settings('/settings');

  final String route;

  const AppNamedRoutes(this.route);
}