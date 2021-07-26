import 'dart:convert';

import 'package:f_api/models/article.dart';
import 'package:http/http.dart' as http;

class ServiceApi {
  final url =
      "https://newsapi.org/v2/everything?q=tesla&from=2021-06-26&sortBy=publishedAt&apiKey=8460b2be9b5a4122a114209e3966927e";

  Future<List<Article>> getData() async {
    final response = await http.get(Uri.parse(url));

    Map<String, dynamic> body = jsonDecode(response.body);

    List<dynamic> listArticle = body["articles"];

    return listArticle.map((e) => Article.fromJson(e)).toList();
  }

  void postData(String title) async {
    final response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': title,
      }),
    );
    if (response.statusCode == 201) {
      print("ok");
    } else {
      print("nok");
    }
  }
}
