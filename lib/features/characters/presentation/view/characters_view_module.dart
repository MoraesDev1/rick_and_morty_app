import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/provider/providers.dart';
import 'package:rick_and_morty_app/core/widgets/layout/responsive_view_widget.dart';
import 'package:rick_and_morty_app/features/characters/presentation/view/phone/ph_characters_view.dart';
import 'package:rick_and_morty_app/features/characters/presentation/view/tablet/ta_characters_view.dart';
import 'package:rick_and_morty_app/features/characters/presentation/view/web/web_characters_view.dart';
import 'package:rick_and_morty_app/features/characters/presentation/viewmodel/characters_viewmodel.dart';

class CharactersViewModule extends StatefulWidget {
  const CharactersViewModule({super.key});

  @override
  State<CharactersViewModule> createState() => _CharactersViewModuleState();
}

class _CharactersViewModuleState extends State<CharactersViewModule> {
  late CharactersViewModel viewModel;
  @override
  void initState() {
    viewModel = getIt.get<CharactersViewModel>();
    viewModel.getAllCharacters();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ResponsiveViewWidget(
        phone: PhCharactersView(viewModel: viewModel), 
        tablet: TaCharactersView(),
        web: WebCharactersView(),
    );
  }
}