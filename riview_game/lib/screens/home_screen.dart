import 'package:flutter/material.dart';
import '../data/game_data.dart';
import '../models/game.dart';
import '../screens/detail_screen.dart';
import '../screens/search_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<Game> favorites;
  final Function(Game) onFavoriteTap;

  HomeScreen({required this.favorites, required this.onFavoriteTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Game Review"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => SearchScreen()),
              );
            },
          ),
        ],
      ),

      body: ListView.builder(
        itemCount: gameList.length,
        itemBuilder: (context, index) {
          final game = gameList[index];
          final isFavorite = favorites.contains(game);

          return Card(
            margin: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            elevation: 2,
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                  game.coverUrl,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),

              title: Text(
                game.title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              subtitle: Text("${game.genre} • ⭐ ${game.rating}"),

              // ❤️ Button Favorite
              trailing: IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : Colors.grey,
                ),
                onPressed: () => onFavoriteTap(game),
              ),

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => DetailScreen(game: game)),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
