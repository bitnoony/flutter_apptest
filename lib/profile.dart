import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("사용자 정보"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
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
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('변경'),
            onTap: (){

            },
            trailing: Icon(Icons.add),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('변경'),
            onTap: (){

            },
            trailing: Icon(Icons.add),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('변경'),
            onTap: (){

            },
            trailing: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
