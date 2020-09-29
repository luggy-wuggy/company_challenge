import 'dart:convert';
import 'package:fetch_challenge/models/fetch_model.dart';
import 'package:http/http.dart' as http;

/// This is an asynchronous function that retrieves json from AWS S3 link
/// and maps and converts into a list of Fetch object
Future<List<Fetch>> fetchJSON() async {
  var url = "https://fetch-hiring.s3.amazonaws.com/hiring.json";
  var response = await http.get(url);

  // This is the return object.
  var fetchList = List<Fetch>();

  if (response.statusCode == 200) {
    var jsonFetchData = json.decode(response.body);
    for (var fetchJson in jsonFetchData) {
      // Filter out any items where 'name' is blank or null.
      if (fetchJson['name'] == null || fetchJson['name'] == '') {
        continue;
      }
      fetchList.add(
        Fetch.fromJson(fetchJson),
      );
    }
  }

  // Sorting the list by 'listId', so it can be grouped when displayed on UI
  fetchList.sort((a, b) => a.listId.compareTo(b.listId));

  return fetchList;
}
