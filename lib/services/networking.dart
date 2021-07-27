import 'package:http/http.dart' as http;
import 'dart:convert';

class Network {
  String url;
  Network({this.url});
  Future fetchdata() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String body = response.body;
      var decodeddata = jsonDecode(body);
      var id = decodeddata['weather'][0]['id'];
      var temp = decodeddata['main']['temp'];
      var city = decodeddata['name'];
      print(city);
      return decodeddata;
    } else {
      print(response.statusCode);
    }
  }
}
