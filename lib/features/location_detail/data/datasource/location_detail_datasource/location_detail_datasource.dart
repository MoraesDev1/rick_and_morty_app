abstract class LocationDetailDatasource {
  Future<Map<String, dynamic>> getLocationById({
    required int id,
  });
}