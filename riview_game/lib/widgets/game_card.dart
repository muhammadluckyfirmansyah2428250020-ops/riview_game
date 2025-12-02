import 'package:flutter/material.dart';
import '../models/game.dart';

class GameCard extends StatelessWidget {
  final Game game;
  final Function() onTap;

  GameCard({required this.game, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Image.network(game.coverUrl, width: 60, fit: BoxFit.cover),
        title: Text(game.title),
        subtitle: Text("${game.genre} • Rating: ${game.rating}"),
        onTap: onTap,
      ),
    );
  }
}
