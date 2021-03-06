import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apptest/addpage.dart';
import 'package:flutter_apptest/boardPage.dart';
import 'package:flutter_apptest/constants/size.dart';
import 'package:flutter_apptest/profilepage.dart';
import 'package:flutter_apptest/viewpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:ui';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(58, 66, 86, 1.0),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage()
     );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //var now = Jiffy().format("yyyy년 MM월 dd일");

  QuerySnapshot data;
  int _selectedIndex = 0;
  PageController _pageController = PageController();

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(_selectedIndex, duration: Duration(milliseconds: 200), curve: Curves.fastOutSlowIn);
    });
  }

  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();

  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

  }

  @override
  Widget build(BuildContext context) {
    if(size == null){
      size = MediaQuery.of(context).size;
    }
    loadData();
    return Scaffold(

        body: PageView(
          controller: _pageController,
          children: [
            Container(
              color: Colors.cyanAccent,
              child: MainPage(),
            ),
            Container(
              color: Colors.amberAccent,
              child: BoardPage(),
            ),
            Container(
              color: Colors.greenAccent,
              child: ProfilePage(),
            ),
          ],
          onPageChanged: (index){
            setState(() {
              _selectedIndex = index;
            });
          },
        ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        selectedItemColor: Colors.amberAccent,
        unselectedItemColor: Colors.white,
        onTap: _onTap,
        currentIndex: _selectedIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.folder_open),title: Text('공지사항')),
          BottomNavigationBarItem(icon: Icon(Icons.create_new_folder ),title: Text('커뮤니티')),
          BottomNavigationBarItem(icon: Icon(Icons.person),title: Text('프로필', )),

        ],
      ),

    );
  }

  Future<void> loadData() async {
    data = await FirebaseFirestore.instance.collection("board").get();
    setState(() {});
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("공지사항"),
        centerTitle: true,
        actions: [
      IconButton(
      icon: Icon(Icons.add_circle, size: 35,),
      color: Colors.amber,
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder:  (context) => AddPage()));
      },
      )
        ],
      ),
      body: FutureBuilder<QuerySnapshot>(
          future: FirebaseFirestore.instance.collection("board").orderBy('time', descending: true).get(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              return ListView(
                children: snapshot.data.docs.map((e) => Card(
                  child: ListTile(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(     // documentData.data["title"]
                              builder: (context)=> ViewPage(e.data()["title"],e.data()["content"],e.reference,e.data()["name"],e.data()["date"])
                          )
                      );
                    },
                    leading: Text(e.data()["date"]),
                    title: Text(e.data()["title"] ?? ""), //subtitle: Text(e.data()["content"] ?? ""),
                    trailing: Text(e.data()["name"]), //Icon(Icons.arrow_forward),
                    dense: true,
                  ),
                )).toList(),
              );
            }else{
              return Center(child: CircularProgressIndicator(),);
            }
          }),
    );

  }
}

