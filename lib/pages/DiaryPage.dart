import 'dart:ffi';

import 'package:flutter/material.dart';

import '../models/Diary.dart';
import 'DiaryDetail.dart';

import 'package:diary_todo/extensions/DateFormatExtensions.dart';

class DiaryPage extends StatefulWidget {
  @override
  _DiaryPage createState() => _DiaryPage();
}

class _DiaryPage extends State<DiaryPage> {
  Card _createCard(Diary diary, BuildContext context) {
    return Card(
      child: ListTile(
        title: Text("[${diary.dateTime.format()}]${diary.title}"),
        subtitle: Text("${diary.subTitle}${diary.name}"),
        leading: const CircleAvatar(
          child: Icon(Icons.book),
        ),
        trailing: const Icon(Icons.more_vert),
        onTap: () async {
          var editDiary = await Navigator.push(context,
              MaterialPageRoute(builder: (context) {
            return DiaryDetailPage(
              diary: diary,
            );
          }));

          if (editDiary != null) {
            setState(() {
              diaryList?.remove(diary);
              diaryList?.add(editDiary);
            });
          }
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
        if (diaryList?.isEmpty ?? true)
          const SizedBox(
            height: 200,
            child: Text(
              "直近の日記はありません。",
              style:
                  TextStyle(color: Color.fromARGB(200, 0, 0, 0), fontSize: 20),
            ),
          )
        else
          Container(
            height: 350,
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
