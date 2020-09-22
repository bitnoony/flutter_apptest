import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apptest/viewpage.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
 QuerySnapshot data;

/*
  Future<void> loadData() async {
    data = await FirebaseFirestore.instance.collection("board").where('name', isEqualTo: '송빛누니').get();
    setState(() {});
  }
*/

  @override
  Widget build(BuildContext context) {
   // loadData();
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("사용자 정보"),
        centerTitle: true,
      ),
      body:
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/noony_profile.png'),
                  backgroundColor: Colors.white,
                ),
                accountName: Text('송빛누니', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize:18),),
                accountEmail: Text('bitnoony@gmail.com', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),),
                onDetailsPressed: () {
                  print('setting clicked');
                },
                arrowColor: Colors.red,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                  boxShadow: [BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10.0,
                    spreadRadius: 4.0,
                  )],
                ),
              ),

/*          FutureBuilder<QuerySnapshot>(
              future: FirebaseFirestore.instance.collection("board").orderBy('time', descending: true).get(),
              builder: (context, snapshot){
                if(snapshot.hasData){
                  return ListView(
                    children: snapshot.data.docs.map((e) => Card(
                      child: ListTile(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(     // documentData.data["title"]
                                  builder: (context)=> ViewPage(e.data()["title"],e.data()["content"],e.reference,e.data()["name"],e.data()["date"],e.data()["timeUpdate"])
                              )
                          );
                        },
                        leading: Text(e.data()["date"]),
                        title: Text(e.data()["title"] ?? ""), //subtitle: Text(e.data()["content"] ?? ""),
                        trailing: Text(e.data()["name"]),//Icon(Icons.arrow_forward),
                        dense: true,
                      ),
                    )).toList(),
                  );
                }else{
                  return Center(child: CircularProgressIndicator(),);
                }
              }),*/

    );




  }
}
