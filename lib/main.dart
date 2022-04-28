import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const SplashWidget(),
    );
  }
}

class SplashWidget extends StatelessWidget {
  const SplashWidget({Key? key}) : super(key: key);

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
  const TabContainerWidget({Key? key}) : super(key: key);

  @override
  _TabContainerWidget createState() => _TabContainerWidget();
}

class _TabContainerWidget extends State<TabContainerWidget> {
  var tabPageList = [DiaryPage(), TodoPage()];
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text("タブコンテイナー"),
            bottom: TabBar(
              isScrollable: true,
              tabs: const [
                Tab(
                    child: Text(
                  "日記",
                  style: TextStyle(color: Colors.white),
                  maxLines: 1,
                )),
                Tab(
                    child: Text(
                  "TODO",
                  style: TextStyle(color: Colors.white),
                ))
              ],
              onTap: (index) => {_onTapItem(index)},
            ),
          ),
          body: TabBarView(children: tabPageList),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.message), label: "Diary"),
              BottomNavigationBarItem(icon: Icon(Icons.book), label: "Todo")
            ],
            onTap: (index) => {_onTapItem(index)},
          ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.book),
            onPressed: () => {
              showModalBottomSheet(
                  context: context,
                  builder: (build) {
                    return Container(
                      color: Colors.blue,
                    );
                  })
            },
          ),
        ));
  }

  void _onTapItem(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}

class DiaryPage extends StatelessWidget {
  DiaryPage({Key? key}) : super(key: key);

  Card _createCard(Diary diary, BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(diary.title),
        subtitle: Text(diary.subTitle),
        leading: const CircleAvatar(
          child: Icon(Icons.book),
        ),
        trailing: Icon(Icons.more_vert),
        onTap: () async {
          var editDiary = await Navigator.push(context, MaterialPageRoute(builder: (context) {
            return DiaryDetail(
              diary: diary,
            );
          }));
        },
      ),
    );
  }

  List<Diary>? diaryList = [
    Diary("松尾", "楽しかった", "あ"),
    Diary("松尾", "悲しかった", "あ"),
    Diary("松尾", "怒った", "あ"),
    Diary("松尾", "愛した", "あ")
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          "直近の日記",
          style: TextStyle(color: Color.fromARGB(200, 0, 0, 0), fontSize: 20),
        ),
        Container(
          height: 400,
          child: ListView.builder(
              itemCount: diaryList?.length ?? 0,
              itemBuilder: (context, index) {
                return _createCard(diaryList![index], context);
              }),
        ),
        const Text(
          "1年前の日記",
          style: TextStyle(color: Color.fromARGB(200, 0, 0, 0), fontSize: 20),
        )
      ],
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

class CreateDiary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
    );
  }
}

class Diary {
  Diary(this.name, this.title, this.subTitle);

  String name = "デフォルト";
  String title = "タイトル";
  String subTitle = "サブタイトル";
  DateTime dateTime = DateTime.now();
}

class DiaryDetail extends StatelessWidget {
  final Diary diary;

  DiaryDetail({required this.diary}) : super();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [Text(diary.name), Text(diary.title), Text(diary.subTitle)],
      ),
    );
  }
}
