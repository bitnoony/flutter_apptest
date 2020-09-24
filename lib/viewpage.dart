import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:flutter_apptest/main.dart';

class ViewPage extends StatelessWidget {

  var title ='';
  var content= '';
  var name ='';
  var date= '';
  DocumentReference ref;

  ViewPage(this.title, this.content, this.ref, this.date, this.name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("공지사항 보기"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                hintText: title,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              onChanged: (String str1) {
                title = str1;
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              maxLines: 6,
              decoration: InputDecoration(
                filled: true,
                hintText: content,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              onChanged: (String str2) {
                content = str2;
              },
            ),

            SizedBox(
              height: 10,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  child: Text("수정"),
                  color: Colors.blue,
                  onPressed: (){
                    ref.update({'title' : title, 'content' : content});
                    Navigator.pop(context);
                  },
                  textColor: Colors.white,
                ),
                SizedBox(
                  width:10,
                ),
                RaisedButton(
                  child: Text("삭제"),
                  color: Colors.redAccent,
                  onPressed: (){
                    ref.delete();
                    Navigator.pop(context);
                  },
                  textColor: Colors.white,
                ),
              ],

            ),
          ],
        ),
      ),
    );
  }
}
