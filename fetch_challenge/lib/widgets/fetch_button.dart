import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/home_screen_provider.dart';

class FetchButton extends StatelessWidget {
  final String _title = 'Fetch my list';

  @override
  Widget build(BuildContext context) {
    HomeScreenProvider homeProvider = Provider.of<HomeScreenProvider>(context);

    return Center(
      child: RaisedButton(
        onPressed: () {
          homeProvider.toggleFetching();
        },
        child: Text(_title),
        elevation: 5,
        color: Colors.amber[400],
        splashColor: Colors.blueGrey[100],
      ),
    );
  }
}
