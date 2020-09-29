import 'package:flutter/material.dart';

import '../models/fetch_model.dart';
import '../services/fetch_json_service.dart' as jsonService;

/// A provider model that contains data that can be accessed in any parts of the HomeScreen and it's widgets.
class HomeScreenProvider extends ChangeNotifier {
  /// This boolean is to trigger user action on FetchButton.
  /// Default value is false.
  bool isFetching = false;

  /// The list of [Fetch] objects in which will be displayed on UI
  List<Fetch> fetchList = [];

  /// Triggers the value [isFetching], so the UI can change accordingly
  void toggleFetching() {
    isFetching = true;
    notifyListeners();
  }

  /// Calls the [fetch_json_service], in order to retrieve data from AWS S3
  /// and returns a List of Fetch objects once complete
  Future<List<Fetch>> fetchData() async {
    fetchList = await jsonService.fetchJSON();
    return fetchList;
  }
}
