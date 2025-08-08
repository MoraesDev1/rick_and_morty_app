abstract class CharacterDetailDatasource {
  Future<Map<String, dynamic>> getCharacterById({
    required int id,
  });
}