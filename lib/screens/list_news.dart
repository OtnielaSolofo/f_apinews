import 'package:flutter/material.dart';
import 'package:f_api/services/service_api.dart';
import 'package:f_api/screens/main_screen.dart';
import 'package:f_api/models/article.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  ServiceApi serviceApi = ServiceApi();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: FutureBuilder(
            future: serviceApi.getData(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
              if (snapshot.hasData) {
                List<Article>? list = snapshot.data;

                if (list != null) {
                  return ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) =>
                        MainScreen(context, list[index]),
                  );
                }
              }

              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
