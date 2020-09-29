import 'package:fetch_challenge/models/fetch_model.dart';
import 'package:fetch_challenge/services/fetch_json_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Fetch> _fetchList = List<Fetch>();

  @override
  void initState() {
    fetchJSON().then(
      (value) {
        setState(
          () {
            _fetchList.addAll(value);
          },
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My List'),
        backgroundColor: Colors.blueGrey[200],
        centerTitle: true,
      ),
      backgroundColor: Colors.blueGrey[100],
      body: true
          ? ListView.builder(
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
                            "${_fetchList[index].listId}",
                            style: TextStyle(
                              fontSize: 27,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "${_fetchList[index].name}",
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
              itemCount: _fetchList.length,
            )
          : Center(
              child: RaisedButton(
                focusColor: Colors.lightBlue[200],
                splashColor: Colors.blueGrey[300],
                highlightColor: Colors.lightBlue[300],
                color: Colors.blueGrey[300],
                textColor: Colors.white,
                child: Text('Fetch my list'),
                onPressed: () {
                  //fetch json data service
                },
              ),
            ),
    );
  }
}
