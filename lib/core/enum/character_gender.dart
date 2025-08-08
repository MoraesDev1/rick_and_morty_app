enum CharacterGender {
  female('Feminino'),
  male('Masculino'),
  genderless('Sem gênero'),
  unknown('Desconhecido');

  final String description;

  const CharacterGender(this.description);
  
  static CharacterGender fromString(String value) {
    return CharacterGender.values.firstWhere(
      (element) => element.name.toLowerCase() == value.toLowerCase(),
      orElse: () => CharacterGender.unknown,
    );
  }
}