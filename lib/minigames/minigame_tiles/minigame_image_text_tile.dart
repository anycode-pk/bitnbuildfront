import 'package:flutter/material.dart';
import 'package:bitnbuildfront/minigames/minigame_tiles/minigame_generic_tile.dart';

class MinigameImageTextTile extends StatefulWidget {
  const MinigameImageTextTile(
      {super.key,
      required this.tileImageURL,
      required this.tileText,
      required this.tileEventId,
      required this.callback,
      required this.disabled});
  final String tileImageURL;
  final String tileText;
  final int tileEventId;
  final bool disabled;
  final Function callback;

  @override
  State<MinigameImageTextTile> createState() => _MinigameImageTextTile();
}

class _MinigameImageTextTile extends State<MinigameImageTextTile> {
  @override
  Widget build(BuildContext context) {
    return MinigameGenericTile(
        callback: widget.callback,
        disabled: widget.disabled,
        tileEventId: widget.tileEventId,
        tileContents: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image(
              image: Image.network(widget.tileImageURL).image,
              color: Colors.white54,
              colorBlendMode: BlendMode.screen,
              fit: BoxFit.cover,
            ),
            Center(
              child: Text(
                widget.tileText,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ));
  }
}
