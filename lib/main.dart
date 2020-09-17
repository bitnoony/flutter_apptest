import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apptest/addpage.dart';
import 'package:flutter_apptest/viewpage.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp()); }


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}



class MyHomePage extends StatefulWidget {
/*  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;*/

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

 //  var _todoController = TextEditingController();
  var data;


  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  void dispose() {
    super.dispose();
 //   _todoController.dispose();
  }

   void _incrementCounter() {
   Firestore.instance.collection("test").doc("RA0Txb9hziuhWSp5dV4H").update({"title": "to"});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("게시판 글목록"),
        actions: [
          MaterialButton(
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext c) => AddPage()));
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.library_books,
              color: Colors.grey[850],),
            trailing: Icon(Icons.arrow_forward),
              title: Text('안녕하세요'),
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext c) => ViewPage()));
      },
            ),
          ListTile(
            leading: Icon(Icons.library_books,
              color: Colors.grey[850],),
            trailing: Icon(Icons.arrow_forward),
            title: Text('hi, everyone'),
            onTap: (){

            },
          ),
          ListTile(
            leading: Icon(Icons.library_books,
              color: Colors.grey[850],),
            trailing: Icon(Icons.arrow_forward),
            title: Text('Guten Tag!'),
            onTap: (){

            },
          ),
          ListTile(
            leading: Icon(Icons.library_books,
              color: Colors.grey[850],),
            trailing: Icon(Icons.arrow_forward),
            title: Text('오늘 날짜가 좋아요'),
            onTap: (){

            },
          ),
        ],
      ),
    );
  }

  void loadData() {
    Firestore.instance.collection("board").get().then((QuerySnapshot value) {
      setState(() {
        data = value.docs[1].data();
      });
    });
  }
}
