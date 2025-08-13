abstract class EpisodeDetailDatasource {
  Future<Map<String, dynamic>> getEpisodeById({
    required int id,
  });

  Future<List<Map<String, dynamic>>> getMultipleCharactersByIds({
    required List<String> ids,
  });
}