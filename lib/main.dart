import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apptest/addpage.dart';
import 'package:flutter_apptest/viewpage.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


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
      routes: {
        "/start": (BuildContext c) => MyHomePage()
      },
      initialRoute: "/start",
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
  // var data;
  QuerySnapshot data;


/*
 Future<QuerySnapshot> getDocuments({
  platform.Source source = platform.Source.serverAndCache,
 }) async {
   assert(source != null);
   final docs = await _delegate.getDocuments(source: source);
   return QuerySnapshot._(docs, firestore);
 }

 List<DocumentSnapshot> get documents => _delegate.documents.map((item) => DocumentSnapshot._(item, _firestore)).toList();
*/

//Future<DocumentSnapshot> titleList = Firestore.instance.collection('board').document().get();


  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    //   _todoController.dispose();
  }

/*   void _incrementCounter() {
   Firestore.instance.collection("test").doc("RA0Txb9hziuhWSp5dV4H").update({"title": "to"});
  }*/

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    loadData();
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
        // ignore: missing_return
        body: FutureBuilder<QuerySnapshot>(
          future: FirebaseFirestore.instance.collection("board").get(),
            builder: (context, snapshot){
          if(snapshot.hasData){
            return ListView(
              children: snapshot.data.docs.map((e) => ListTile(
                onTap: (){
                  Navigator.push( context,
                      MaterialPageRoute(
                          builder:
                              (context)=> ViewPage(e.data()["title"],e.data()["content"],e.reference)
                      )
                  );
                },
                title: Text(e.data()["title"] ?? ""),
                // subtitle: Text(e.data()["content"] ?? ""
                // ),
              )).toList(),
            );
          }else{
            return Center(child: CircularProgressIndicator(),);
          }
        })
    );
  }

  Future<void> loadData() async {
    data = await FirebaseFirestore.instance.collection("board").get();
    setState(() {});

    print("_________");

/*  FirebaseFirestore.instance.collection("board").get().then((value){
    print(value);
  });
  print("sss");*/

    //Future<DocumentSnapshot> titleList = Firestore.instance.collection('board').document().get();

  }

}




