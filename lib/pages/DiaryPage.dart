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

  Widget _createTile(Diary diary, BuildContext context) {
    return GestureDetector(
        child: Material(
          elevation: 1,
          child: Container(
            margin: EdgeInsets.all(10),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.greenAccent, width: 4)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${diary.dateTime.format()}"),
                Text(diary.title),
                Text(diary.subTitle)
              ],
            ),
          ),
        ),
        onTap: () async {
          var editDairy = await Navigator.push(context,
              MaterialPageRoute(builder: (context) {
            return DiaryDetailPage(diary: diary);
          }));

          if (editDairy != null) {
            setState(() {
              diaryRecentList?.remove(diary);
              diaryRecentList?.add(editDairy);
            });
          }
        });
  }

  List<Diary>? diaryList = [
    Diary("??????", "???????????????", "???"),
    Diary("??????", "???????????????", "???"),
    Diary("??????", "?????????", "???"),
    Diary("??????", "?????????", "???"),
    Diary("??????", "?????????2", "???"),
    Diary("??????", "?????????4", "???"),
    Diary("??????", "?????????5", "???")
  ];

  List<Diary>? diaryRecentList = [
    Diary("??????", "???????????????", "???"),
    Diary("??????", "???????????????", "???"),
    Diary("??????", "?????????", "???"),
    Diary("??????", "?????????", "???"),
    Diary("??????", "?????????", "???"),
    Diary("??????", "?????????", "???"),
    Diary("??????", "?????????", "???"),
    Diary("??????", "?????????", "???"),
    Diary("??????", "?????????", "???"),
    Diary("??????", "?????????", "???"),
    Diary("??????", "?????????", "???")
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            "???????????????",
            style: TextStyle(color: Color.fromARGB(200, 0, 0, 0), fontSize: 20),
          ),
          if (diaryList?.isEmpty ?? true)
            const SizedBox(
              height: 200,
              child: Text(
                "????????????????????????????????????",
                style: TextStyle(
                    color: Color.fromARGB(200, 0, 0, 0), fontSize: 20),
              ),
            )
          else
            SizedBox(
              height: 350,
              child: ListView.builder(
                  itemCount: diaryList?.length ?? 0,
                  itemBuilder: (context, index) {
                    return _createCard(diaryList![index], context);
                  }),
            ),
          const Text(
            "1???????????????",
            style: TextStyle(color: Color.fromARGB(200, 0, 0, 0), fontSize: 20),
          ),
          Expanded(
              child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            itemCount: diaryRecentList?.length ?? 0,
            itemBuilder: (context, index) {
              return _createTile(diaryRecentList![index], context);
            },
          ))
        ],
      ),
    );
  }
}
