import 'package:flutter/material.dart';
import '../models/game.dart';
import '../widgets/game_card.dart';
import 'detail_screen.dart';

class FavoritesScreen extends StatefulWidget {
  final List<Game> favorites;
  FavoritesScreen({required this.favorites});

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Favorite Games")),
      body: widget.favorites.isEmpty
          ? Center(child: Text("Belum ada game favorit."))
          : ListView.builder(
              itemCount: widget.favorites.length,
              itemBuilder: (context, index) {
                return GameCard(
                  game: widget.favorites[index],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailScreen(game: widget.favorites[index]),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
