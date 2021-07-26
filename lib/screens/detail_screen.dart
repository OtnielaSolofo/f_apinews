import 'package:f_api/models/article.dart';
import 'package:f_api/services/service_api.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final Article article;

  DetailScreen({required this.article});

  ServiceApi serviceApi = ServiceApi();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text(article.title.toString()),
          ),
          body: Column(
            children: [
              Text(
                article.description.toString(),
                style: TextStyle(color: Colors.black45),
              ),
              FlatButton(
                  onPressed: () {
                    serviceApi.postData("mon post");
                  },
                  child: Expanded(
                    child: Text("post data"),
                  ))
            ],
          )),
    );
  }
}
