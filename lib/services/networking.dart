import 'package:http/http.dart' as http;
import 'dart:convert';
const String apikey='YOUR API KEY';
class NetworkHelper {
  String _url = '';

  NetworkHelper(String url) {
    this._url = url;
  }

  Future getData() async {
    print(_url);
    var url = Uri.parse(_url);
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      var weatherdata = jsonDecode(data);
      return weatherdata;
    }
    // else{
    //   return 'error';
    // }
  }
}
