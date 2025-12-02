import 'package:flutter/material.dart';
import '../data/game_data.dart';
import '../widgets/game_card.dart';
import '../screens/detail_screen.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchCtrl = TextEditingController();
  List filtered = [];

  @override
  void initState() {
    super.initState();
    filtered = gameList;
  }

  void search(String query) {
    final results = gameList.where((game) {
      return game.title.toLowerCase().contains(query.toLowerCase());
    }).toList();

    setState(() {
      filtered = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Search")),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              controller: searchCtrl,
              onChanged: search,
              decoration: InputDecoration(
                labelText: "Search game...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filtered.length,
              itemBuilder: (context, index) {
                final game = filtered[index];
                return GameCard(
                  game: game,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => DetailScreen(game: game)),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
