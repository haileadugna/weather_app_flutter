import 'package:http/http.dart' as http;
import 'dart:convert';
import 'location.dart';

import '../screen/loading_screen.dart';

class NetworkHelper {
  NetworkHelper(this.url);
  Location location = Location();
  final String url;

  Future getData() async {
    // Uri uri = Uri.parse(url); // Convert the url string to a Uri object
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200 || response.statusCode == 201) {
      String data = response.body;

      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}


// 'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric'