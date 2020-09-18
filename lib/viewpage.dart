import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ViewPage extends StatelessWidget {


  var title ='';
  var content= '';
  DocumentReference ref;

  ViewPage(this.title, this.content, this.ref);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("글 내용 보기"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: title,
                contentPadding: EdgeInsets.symmetric(horizontal: 20.0)
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              maxLines: 6,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: content,
              ),
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
                    ref.update({});
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
