enum ApiEndpoint {
  characters('/character/'),
  locations('/location/'),
  episodes('/episode/');

  final String path;

  const ApiEndpoint(this.path);
}