import 'dart:convert';
import 'package:fetch_challenge/models/fetch_model.dart';
import 'package:http/http.dart' as http;

Future<List<Fetch>> fetchJSON() async {
  var url = "https://fetch-hiring.s3.amazonaws.com/hiring.json";
  var response = await http.get(url);

  var fetchList = List<Fetch>();

  if (response.statusCode == 200) {
    var jsonFetchData = json.decode(response.body);
    for (var fetchJson in jsonFetchData) {
      if (fetchJson['name'] == null || fetchJson['name'] == '') {
        continue;
      }
      fetchList.add(
        Fetch.fromJson(fetchJson),
      );
    }
  }

  return fetchList;
}
