import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:diary_todo/extensions/DateFormatExtensions.dart';

import '../models/Diary.dart';

class DiaryDetailPage extends StatelessWidget {
  final Diary diary;

  String? name;
  String? title;
  String? subTitle;

  DiaryDetailPage({required this.diary}) : super();

  @override
  StatelessElement createElement() {
    // TODO: implement createElement
    name = diary.name;
    title = diary.title;
    subTitle = diary.subTitle;

    return super.createElement();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Text(
                diary.dateTime.format(),
              ),
              alignment: Alignment.topLeft,
            ),
            TextField(
              controller: TextEditingController(text: diary.name),
              decoration:
                  InputDecoration(labelText: "名前", hintText: diary.name),
              onChanged: (text) {
                name = text;
              },
            ),
            TextField(
              controller: TextEditingController(text: diary.title),
              decoration:
                  InputDecoration(labelText: "タイトル", hintText: diary.title),
              onChanged: (text) {
                title = text;
              },
            ),
            TextField(
              controller: TextEditingController(text: diary.subTitle),
              decoration: InputDecoration(
                  labelText: "サブタイトル", hintText: diary.subTitle),
              onChanged: (text) {
                subTitle = text;
              },
            ),
            ElevatedButton(
                onPressed: () => {
                      // 変更があった場合に、コールバック
                      if (name != diary.name ||
                          title != diary.title ||
                          subTitle != diary.subTitle)
                        {
                          Navigator.pop<Diary>(context,
                              Diary(name ?? "", title ?? "", subTitle ?? ""))
                        }
                      else
                        {Navigator.pop(context)}
                    },
                child: Text("完了"))
          ],
        ),
      ),
    );
  }
}
