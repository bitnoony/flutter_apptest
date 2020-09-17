import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apptest/main.dart';

class AddPage extends StatefulWidget {

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  String title = '';
  String content = '';
  var docName = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("새글 쓰기")),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                style: TextStyle(fontSize: 32, color: Colors.red),
                textAlign: TextAlign.center,
                decoration: InputDecoration(hintText: '입력해 주세요'),
                onChanged: (String str) {
                  setState(() => title = str);
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                maxLines: 4,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '내용을 입력하세요.',
                ),
                onChanged: (String str2) {
                  setState(() => content = str2);
                },
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                color: Colors.green,
                textColor: Colors.white,
                child: Text("저장"),
                onPressed: () {
                  Firestore.instance
                      .collection("board")
                      .doc("$docName")
                      .setData({"title": title, "content" : content});
                 // Navigator.push(context, MaterialPageRoute(builder: (BuildContext c)=>MyHomePage()));
                  showDialog(context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context)
                      {
                        return AlertDialog(
                          title: Text('글 작성 완료'),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: [
                                Text('글이 저장되었습니다.'),
                                Text('메인화면으로 이동합니다.'),
                              ],
                            ),
                          ),
                          actions: [
                            FlatButton(
                              child: Text('OK'),
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (BuildContext c)=>MyHomePage()));
                              },
                            ),

                          ],
                        );
                      });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
