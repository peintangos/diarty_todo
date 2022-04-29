import 'package:flutter/material.dart';

import '../models/Diary.dart';
import 'DiaryPage.dart';
import 'TodoPage.dart';

class TabContainerWidget extends StatefulWidget {
  const TabContainerWidget({Key? key}) : super(key: key);

  @override
  _TabContainerWidget createState() => _TabContainerWidget();
}

class _TabContainerWidget extends State<TabContainerWidget> {
  var tabPageList = [DiaryPage(), TodoPage()];
  var selectedIndex = 0;

  String name = '';
  String title = '';
  String subTitle = '';

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
                      child: Column(
                        children: [
                          TextField(
                            decoration: const InputDecoration(labelText: "名前"),
                            onChanged: (text) => {name = text},
                          ),
                          TextField(
                              decoration: const InputDecoration(labelText: "タイトル"),
                              onChanged: (text) => {title = text}),
                          TextField(
                              decoration: const InputDecoration(labelText: "サブタイトル"),
                              onChanged: (text) => {subTitle = text}),
                          ElevatedButton(
                              onPressed: () => {Navigator.pop(context)},
                              child: const Text("作成"))
                        ],
                      ),
                    );
                  }).whenComplete(() {
                    
                Diary newDiary = Diary(name, title, subTitle);

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
