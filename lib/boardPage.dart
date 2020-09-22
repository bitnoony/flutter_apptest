import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_apptest/utils/profile_img_path.dart';
import 'package:flutter_apptest/widgets/comment.dart';


class BoardPage extends StatefulWidget {
  @override
  _BoardPageState createState() => _BoardPageState();
}

class _BoardPageState extends State<BoardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("자유 게시판"),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: 15,
          itemBuilder: (BuildContext context, int index){
            return _postItem(index, context);
          }),
    );
  }

  Column _postItem(int index, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _postHeader('username $index'),
              _postImage(index),
              _postActions(),
              _postLikes(),
              _postCaption(context, index),
              _allComments()
            ],
          );
  }

  FlatButton _allComments() {
    return FlatButton(
                onPressed: null,
                child: Text('show all 18 comments', style: TextStyle(color: Colors.grey[600]),));
  }

  Padding _postCaption(BuildContext context, int index) {
    return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child:  Comment(username: 'username $index',
              caption: 'I love summer soooooooooooooooo much~~~~~~',),
            );
  }

  Padding _postLikes() {
    return Padding(
              padding: const EdgeInsets.only(left: 14),
              child: Text('80 likes',
              style: TextStyle(fontWeight: FontWeight.bold),),
            );
  }

  Row _postActions() {
    return Row(
              children: [
                IconButton(
                  icon: ImageIcon(
                    AssetImage('assets/noony_profile.png'),
                    color: Colors.black87,
                  ),
                ),
                IconButton(
                  icon: ImageIcon(
                    AssetImage('assets/noony_profile.png'),
                    color: Colors.black87,
                  ),
                ),
                IconButton(
                  icon: ImageIcon(
                    AssetImage('assets/noony_profile.png'),
                    color: Colors.black87,
                  ),
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.check_circle,
                    color: Colors.redAccent,
                  ),
                ),
              ],
            );
  }

  Row _postHeader(String username) {
    return Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(
                      getProfileImgPath(username)
                    ),
                    radius: 16,
                  ),
                ),
                Expanded(child: Text(username)),
                IconButton(
                  icon: Icon(Icons.more_horiz, color: Colors.black87,),
                  onPressed: null,
                )
              ],
            );
  }

  CachedNetworkImage _postImage(int index) {
    return CachedNetworkImage(imageUrl: 'https://picsum.photos/id/$index/200/300',
              imageBuilder: (BuildContext context, ImageProvider imageProvider)=> 
                  AspectRatio(
                    aspectRatio:  1 ,
                    child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover
                    )
                ),
              ),
                  ),);
  }
}
