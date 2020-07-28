import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Favorite'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text('Your favorites meals...'),
      ),
    );
  }
}
