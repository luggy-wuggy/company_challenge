import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/home_screen_provider.dart';

class CardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeScreenProvider homeProvider = Provider.of<HomeScreenProvider>(context);

    return FutureBuilder(
      future: homeProvider.fetchData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        // Display a loading UI if we have not yet fetched all data
        if (snapshot.data == null) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.amber[400],
            ),
          );
          // Display a list of cards once we've fetched all the data
        } else {
          return Scrollbar(
            child: ListView.builder(
              itemCount: homeProvider.fetchList.length,
              itemBuilder: (context, int index) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                      top: 25,
                      bottom: 25,
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          Text(
                            "${snapshot.data[index].listId}",
                            style: TextStyle(
                              fontSize: 27,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "${snapshot.data[index].name}",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
