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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {   //route별 명칭 지정후 사용하는 방법
          '/' : (BuildContext context) => MyHomePage(),
          '/add' : (BuildContext context) => AddPage(),

        },
      initialRoute: '/',
     );
  }
}


class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

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

    //   _todoController.dispose();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  //   loadData();
  }

  @override
  Widget build(BuildContext context) {
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
              child: AddPage(),
            ),
            Container(
              color: Colors.greenAccent,

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
        onTap: _onTap,
        currentIndex: _selectedIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.folder_open),title: Text('home')),
          BottomNavigationBarItem(icon: Icon(Icons.create),title: Text('wirte')),
          BottomNavigationBarItem(icon: Icon(Icons.person),title: Text('setting')),

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
      appBar: AppBar(
        title: Text("게시판 글목록"),

      ),
      body: FutureBuilder<QuerySnapshot>(
          future: FirebaseFirestore.instance.collection("board").get(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              return ListView(
                children: snapshot.data.docs.map((e) => ListTile(
                  leading: Icon(Icons.library_books),
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(     // documentData.data["title"]
                            builder: (context)=> ViewPage(e.data()["title"],e.data()["content"],e.reference)
                        )
                    );
                  },
                  title: Text(e.data()["title"] ?? ""), //subtitle: Text(e.data()["content"] ?? ""),
                  trailing: Icon(Icons.arrow_forward),
                )).toList(),
              );
            }else{
              return Center(child: CircularProgressIndicator(),);
            }
          }),
    );

  }
}

