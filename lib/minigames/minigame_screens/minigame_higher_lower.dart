import 'package:flutter/material.dart';

import 'package:bitnbuildfront/minigames/minigame_screens/minigame_generic.dart';
import 'package:bitnbuildfront/minigames/minigame_tiles/minigame_image_text_tile.dart';

class MinigameHigherLower extends StatefulWidget {
  const MinigameHigherLower(
      {super.key,
      required this.question,
      required this.answerId,
      required this.currentProgress,
      required this.maxProgress});
  final String question;
  final int answerId;
  final int currentProgress;
  final int maxProgress;

  @override
  State<MinigameHigherLower> createState() => _MinigameHigherLower();
}

class _MinigameHigherLower extends State<MinigameHigherLower> {
  int _selectedId = 0;
  bool _submitted = false;
  Color _answerColor = Colors.blue;
  
  void _checkAnswer() {
    setState(() {
      if(!_submitted) {
      if(_selectedId == widget.answerId) {
        _answerColor = Colors.green;
      }
      else {
        _answerColor = Colors.red;
      }  
    _submitted = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MinigameGeneric(
        question: widget.question,
        currentProgress: widget.currentProgress,
        maxProgress: widget.maxProgress,
        minigameContent: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MinigameImageTextTile(
                callback: (val) => setState(() => _selectedId = val),
                disabled: _submitted,
                tileImage: AssetImage('kazimierz-wielki.jpg'),
                tileText: 'kazimierz wielki',
                tileEventId: 1,
              ),
              MinigameImageTextTile(
                callback: (val) => setState(() => _selectedId = val),
                disabled: _submitted,
                tileEventId: 2,
                tileImage: AssetImage('mieszko-I.jpg'),
                tileText: 'mieszko 1',
              ),
              FilledButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(_answerColor),
                ),
                onPressed: _checkAnswer,
                child: Text("Submit"),
              )
            ]));
  }
}