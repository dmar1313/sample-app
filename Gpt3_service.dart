import 'dart:convert';
import 'package:http/http.dart' as http;

class Gpt3Service {
  static Future<String> getResponse(String query) async {
    // Replace with your own OpenAI API key and endpoint
    String url = 'https://api.openai.com/v1/engines/gpt-3/jobs';
    String apiKey = 'YOUR_API_KEY';
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey',
    };
    Map<String, dynamic> body = {
      'prompt': query,
      'max_tokens': 1000,
    };
    http.Response response = await http.post(url, headers: headers, body: json.encode(body));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      return data['choices'][0]['text'];
    } else {
      throw Exception('Failed to get response from GPT-3');
    }
  }
}
