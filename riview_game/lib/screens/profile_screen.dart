import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(radius: 60, backgroundImage: NetworkImage("https://api/profile.jpg")),
            SizedBox(height: 20),
            Text("Muhammad Lucky", style: TextStyle(fontSize: 22)),
            SizedBox(height: 10),
            Text("Reviewer Game", style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
