import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:stockscan/model/dataModel.dart';

import '../globals/constants.dart';

class FetchData {
  List<StockScan> getAllData = [];

  Future<bool> loadData() async {
    try {
      var request = http.Request('GET', Uri.parse(url));
      http.StreamedResponse response = await request.send();

      // final response = await http.get(Uri.parse('http://coding-assignment.bombayrunning.com/data.json'));
      if (response.statusCode == 200) {
        // setState(() async {
        final res = (await response.stream.bytesToString());
        final responseInJson = jsonDecode(res);
        signals = responseInJson;
        // List<StockScan> stockScanData = [];
        StockScan dataModel = StockScan(
            color: signals['color'],
            id: signals['id'],
            criteria: signals['criteria'],
            name: signals['name'],
            tag: signals['tag']);
        getAllData = [dataModel];
        print(getAllData);
        // });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e);
    }
    return true;
  }
}
