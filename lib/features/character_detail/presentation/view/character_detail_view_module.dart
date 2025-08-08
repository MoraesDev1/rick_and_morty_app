import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/provider/providers.dart';
import 'package:rick_and_morty_app/core/widgets/layout/responsive_view_widget.dart';
import 'package:rick_and_morty_app/features/character_detail/presentation/arguments/character_detail_arguments.dart';
import 'package:rick_and_morty_app/features/character_detail/presentation/view/phone/ph_character_detail_view.dart';
import 'package:rick_and_morty_app/features/character_detail/presentation/view/tablet/ta_character_detail_view.dart';
import 'package:rick_and_morty_app/features/character_detail/presentation/view/web/web_character_detail_view.dart';
import 'package:rick_and_morty_app/features/character_detail/presentation/viewmodel/character_detail_viewmodel.dart';

class CharacterDetailViewModule extends StatefulWidget {
  final CharacterDetailArguments args;

  const CharacterDetailViewModule({super.key, required this.args});

  @override
  State<CharacterDetailViewModule> createState() => _CharacterDetailViewModuleState();
}

class _CharacterDetailViewModuleState extends State<CharacterDetailViewModule> {
  late CharacterDetailViewModel characterDetailViewModel;
  @override
  void initState() {
    characterDetailViewModel = getIt.get<CharacterDetailViewModel>();
    characterDetailViewModel.getCharacterById(widget.args.characterId);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ResponsiveViewWidget(
        phone: PhCharacterDetailView(characterDetailViewModel: characterDetailViewModel), 
        tablet: TaCharacterDetailView(),
        web: WebCharacterDetailView(),
    );
  }
}