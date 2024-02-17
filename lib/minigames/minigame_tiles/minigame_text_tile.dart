import 'package:flutter/material.dart';
import 'package:bitnbuildfront/minigames/minigame_tiles/minigame_generic_tile.dart';

class MinigameTextTile extends StatefulWidget {
  const MinigameTextTile(
      {super.key, required this.tileText, required this.tileEventId});
  final String tileText;
  final int tileEventId;

  @override
  State<MinigameTextTile> createState() => _MinigameTextTile();
}

class _MinigameTextTile extends State<MinigameTextTile> {
  @override
  Widget build(BuildContext context) {
    return MinigameGenericTile(
      tileEventId: widget.tileEventId,
      tileContents: 
        Center(
          child: Text(
            widget.tileText,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
    ));
  }
}
