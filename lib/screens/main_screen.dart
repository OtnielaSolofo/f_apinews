import 'package:f_api/models/article.dart';
import 'package:f_api/screens/detail_screen.dart';
import 'package:flutter/material.dart';

Widget MainScreen(BuildContext context, Article article) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailScreen(article: article)));
    },
    child: Card(
        elevation: 3,
        child: Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: NetworkImage(article.urlToImage.toString()),
          )),
        )),
  );
}
