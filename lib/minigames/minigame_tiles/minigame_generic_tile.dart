import 'package:flutter/material.dart';

class MinigameGenericTile extends StatefulWidget {
  const MinigameGenericTile({super.key, required this.tileContents, required this.tileEventId});
  final Widget tileContents;
  final int tileEventId;

  @override
  State<MinigameGenericTile> createState() => _MinigameGenericTile();
}

class _MinigameGenericTile extends State<MinigameGenericTile> {
  double _scale = 1.0;
  double _elevation = 5.0;
  bool _tapped = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: AspectRatio(
            aspectRatio: 1,
            child: GestureDetector(
                onTap: () {
                  setState(() {
                    _tapped = !_tapped;
                    _scale = _tapped ? 1.05 : 1.0;
                    _elevation = _tapped ? 10.0 : 5.0;
                  });
                },
                child: AnimatedScale(
                    scale: _scale,
                    curve: Curves.decelerate,
                    duration: const Duration(milliseconds: 60),
                    child: Card(
                      borderOnForeground: true,
                      elevation: _elevation,
                      margin: const EdgeInsets.all(16.0),
                      clipBehavior: Clip.antiAlias,
                      semanticContainer: true,
                      child: widget.tileContents,
                    )))));
  }
}
