import 'package:fetch_challenge/widgets/card_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/home_screen_provider.dart';
import '../widgets/fetch_button.dart';

class HomeScreen extends StatelessWidget {
  final String _title = 'My List';

  @override
  Widget build(BuildContext context) {
    HomeScreenProvider homeProvider = Provider.of<HomeScreenProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        backgroundColor: Colors.blueGrey[200],
        centerTitle: true,
      ),
      backgroundColor: Colors.blueGrey[100],
      body: homeProvider.isFetching ? CardList() : FetchButton(),
    );
  }
}
