import 'package:flutter/material.dart';
import '../models/game.dart';

class DetailScreen extends StatelessWidget {
  final Game game;

  DetailScreen({required this.game});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(game.title)),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Image.network(game.coverUrl),
            SizedBox(height: 16),
            Text(game.title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text("Platform: ${game.platform}"),
            Text("Genre: ${game.genre}"),
            Text("Rating: ${game.rating}"),
            SizedBox(height: 16),
            Text(game.reviewText),
          ],
        ),
      ),
    );
  }
}
