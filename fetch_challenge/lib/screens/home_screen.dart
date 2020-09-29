import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/home_screen_provider.dart';
import '../widgets/fetch_button.dart';
import '../widgets/card_list.dart';

/// HomeScreen displays the home screen of the app.
/// A simple app bar and a button that fetches data
/// from AWS S3 link and then displays the list of object[Fetch]
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
