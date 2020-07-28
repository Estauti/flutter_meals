import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Favorite'),
      ),
      body: Center(
        child: Text('Your favorites meals...'),
      ),
    );
  }
}
