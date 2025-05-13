import 'package:http/http.dart' as http;

class CheckInternetConnection {
  Future<bool> isConnected() async {
    http.Response response = await http
        .get(Uri.parse('https://www.google.com'))
        .timeout(Duration(seconds: 10), onTimeout: () {
      return http.Response('', 404);
    });

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
