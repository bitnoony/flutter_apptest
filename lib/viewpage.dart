import 'package:flutter/material.dart';

class ViewPage extends StatelessWidget {


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
                hintText: "제목",
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
                hintText: "글 내용"
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
