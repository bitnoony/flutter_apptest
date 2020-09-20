import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apptest/main.dart';
import 'package:jiffy/jiffy.dart';

class AddPage extends StatefulWidget {

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  String title = '';
  String content = '';
  String name ='송빛누니';
  var timeUpdate ='';
  var docName = DateTime.now();
  String date = Jiffy().format("M월d일");
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(title: Text("새 글 쓰기"), centerTitle: true,),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                cursorColor: Colors.black,
                style: TextStyle(fontSize: 20, color: Colors.black),
                textAlign: TextAlign.center,

                onChanged: (String str) {
                  title = str;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                cursorColor: Colors.black,
                maxLines: 4,
                style: TextStyle(color: Colors.black),

                onChanged: (String str2) {
                  content = str2;
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
                      .setData({"title": title, "content" : content, "name" : name, "date" : date, "time" : docName, "timeUpdate" : timeUpdate});
                 // Navigator.push(context, MaterialPageRoute(builder: (BuildContext c)=>MyHomePage()));
                  setState(() {
                    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                    //Navigator.push(context, MaterialPageRoute(builder: (BuildContext c)=>MyHomePage()));
                    //_pageController.animateToPage(0, duration: Duration(milliseconds: 200), curve: Curves.fastOutSlowIn);
                  });
                },   //Navigator.popUntil(context, (route)=> route.settings.name == "/start");
              )
            ],
          ),
        ),
      ),
    );
  }
}
