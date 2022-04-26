import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.orange),
      home: SplashWidget(),
    );
  }
}

class SplashWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(("Lets Start Your Diary")),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TabContainerWidget()));
                },
                child: Text("Tap Me"))
          ],
        ),
      ),
    );
  }
}

class TabContainerWidget extends StatefulWidget {
  @override
  _TabContainerWidget createState() => _TabContainerWidget();
}

class _TabContainerWidget extends State<TabContainerWidget> {
  var tabPageList = [DiaryPage(), TodoPage()];
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("タブコンテイナー"),
        ),
        body: tabPageList[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.message), label: "Diary"),
            BottomNavigationBarItem(icon: Icon(Icons.book), label: "Todo")
          ],
          onTap: (index) => {_onTapItem(index)},
        ));
  }

  void _onTapItem(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}

class DiaryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const Center(
      child: Text("Diary"),
    );
  }
}

class TodoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const Center(
      child: Text("Todo"),
    );
  }
}
