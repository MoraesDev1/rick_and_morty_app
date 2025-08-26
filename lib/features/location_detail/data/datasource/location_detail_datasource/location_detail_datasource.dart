abstract class LocationDetailDatasource {
  Future<Map<String, dynamic>> getLocationById({
    required int id,
  });

  Future<List<Map<String, dynamic>>> getResidentsByIds({
    required List<String> ids,
  });
}