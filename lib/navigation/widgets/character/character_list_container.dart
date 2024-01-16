import 'package:flutter/material.dart';
import 'package:rick_and_morty/character_hub/models/character.dart';
import 'package:rick_and_morty/navigation/widgets/status/no_results_message.dart';
import 'package:rick_and_morty/navigation/widgets/status/start_searching_message.dart';

import 'character_card.dart';

class CharacterListContainer extends StatefulWidget {
  final List<Character>? characters;

  const CharacterListContainer({super.key, required this.characters});

  @override
  State<CharacterListContainer> createState() => _CharacterListContainerState();
}

class _CharacterListContainerState extends State<CharacterListContainer> {
  @override
  Widget build(BuildContext context) {
    if (widget.characters == null) {
      return const StartSearchingMessage();
    }

    if (widget.characters!.isEmpty) {
      return const NoResultMessage();
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        key: UniqueKey(),
        children: [
          Text(
            "Search results (${widget.characters!.length}):",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 16),
          ...widget.characters!
              .map((character) => CharacterCard(character: character))
              .toList()
        ],
      ),
    );
  }
}
