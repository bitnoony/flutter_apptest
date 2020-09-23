import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _menuOpened = false;
  Size _size;
  double menuWidth;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery
        .of(context)
        .size;
    menuWidth = _size.width / 1.5;
    return Scaffold(
      body: Stack(
        children: [
          _sideMenu(),
          _profile(),
        ],
      ),
    );
  }

  Widget _sideMenu() {
    return AnimatedContainer(
      width: menuWidth,
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 200),
      color: Colors.grey[200],
      transform: Matrix4.translationValues(
          _menuOpened ? _size.width - menuWidth : _size.width, 0, 0),
      child: SafeArea(
        child: SizedBox(
          width: menuWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              FlatButton(child: Text('Bitnoony'), onPressed: null,)
            ],
          ),
        ),
      ),
    );
  }

  Widget _profile() {
    return AnimatedContainer(
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 200),
      color: Colors.transparent,
      transform: Matrix4.translationValues(_menuOpened ? -menuWidth : 0, 0, 0),
      child: SafeArea(
        child: Column(
          children: [
            _usernameIconButton(),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverList(
                      delegate: SliverChildListDelegate(
                          _coloredContainers()))
                ], // <Widget>[]
              ),
            ),
          ], // <Widget>[]
        ),
      ),
    );
  }

  List<Widget> _coloredContainers() {
    return List<Widget>.generate(
        20,
            (i) =>
            Container(
                height: 150,
                color: Colors.primaries[i % Colors.primaries.length])
    );
  }

  Row _usernameIconButton() {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              'Bitnoony',
              style:
              TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            setState(() {
              _menuOpened = !_menuOpened;
            });
          }, // onPressed
        )
      ], // children
    );
  } // _usernameIconButton()

}
