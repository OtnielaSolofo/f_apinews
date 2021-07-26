import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'screens/list_news.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<PageViewModel> getPages() {
    return [
      PageViewModel(
          title: "Live Demo page 1",
          bodyWidget: Container(
            height: 200,
            width: double.infinity,
            color: Colors.red,
          ),
          footer: Text("Footer Text here "),
          decoration: const PageDecoration(
            pageColor: Color.fromARGB(1, 17, 164, 121),
          )),
      PageViewModel(
        image: Image.asset("assets/splash.png"),
        title: "Live Demo page 2 ",
        body: "Live Demo Text",
        footer: Text("Footer Text  here "),
      ),
      PageViewModel(
        image: Image.asset("assets/splash.png"),
        title: "Live Demo page 3",
        body: "Welcome to Proto Coders Point",
        footer: Text("Footer Text  here "),
      ),
      PageViewModel(
        image: Image.asset("assets/splash.png"),
        title: "Live Demo page 4 ",
        body: "Live Demo Text",
        footer: Text("Footer Text  here "),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "Introduction Screen",
          style: TextStyle(backgroundColor: Color.fromARGB(1, 17, 164, 121)),
        )),
      ),
      body: IntroductionScreen(
        globalBackgroundColor: Colors.white,
        pages: getPages(),
        showNextButton: false,
        showSkipButton: true,
        skip: Text("Skip"),
        done: Text("Got it "),
        onDone: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ListScreen()));
        },
      ),
    );
  }
}
