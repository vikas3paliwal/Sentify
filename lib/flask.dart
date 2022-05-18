import 'package:http/http.dart';

Future getData(url, String query_word) async {
  var query = {'search_text': query_word};

  final uri = Uri.https(url, '/predict', query);
  Response response = await get(uri, headers: {
    "Access-Control-Allow-Origin": "*", // Required for CORS support to work
  });
  return response.body;
}
