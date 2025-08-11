abstract class EpisodeDetailDatasource {
  Future<Map<String, dynamic>> getEpisodeById({
    required int id,
  });
}