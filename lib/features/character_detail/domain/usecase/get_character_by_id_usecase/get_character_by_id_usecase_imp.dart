import 'package:rick_and_morty_app/core/entities/character_entity.dart';
import 'package:rick_and_morty_app/core/error/failure/failure.dart';
import 'package:rick_and_morty_app/core/utils/either_of/either_of.dart';
import 'package:rick_and_morty_app/features/character_detail/domain/repository/character_detail_repository.dart';
import 'package:rick_and_morty_app/features/character_detail/domain/usecase/get_character_by_id_usecase/get_character_by_id_usecase.dart';

class GetCharacterByIdUsecaseImp implements GetCharacterByIdUsecase {
  final CharacterDetailRepository _repository;

  GetCharacterByIdUsecaseImp({
    required CharacterDetailRepository repository,
  }) : _repository = repository;

  @override
  Future<EitherOf<Failure, CharacterEntity>> call({
    required int id,
  }) async {
    return await _repository.getCharacterById(id: id);
  }
}