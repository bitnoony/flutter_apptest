import 'package:flutter/material.dart';
import 'package:flutter_apptest/utils/profile_img_path.dart';

class Comment extends StatelessWidget {
  final String username;
  final bool showProfile;
  final DateTime  dateTime;
  final String caption;

  const Comment({Key key, @required this.username, this.showProfile = false, this.dateTime, @required this.caption}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: showProfile,
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              getProfileImgPath(username)
            ),
            radius: 16,
          ),
        ),
        Visibility(
            visible: showProfile,
            child: SizedBox(width: 18,)),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(
                          text: username ,
                          style: TextStyle(fontWeight: FontWeight.bold)
                      ),
                      TextSpan(
                          text: ""
                      ),
                      TextSpan(
                          text: caption
                      ),
                    ]
                ),
              ),
              SizedBox(height: 14,),
              Visibility(
                  visible: dateTime != null,
                  child: dateTime == null ? SizedBox() : Text(dateTime.toIso8601String(), style: TextStyle(color: Colors.grey[600], fontSize: 10),)),
            ],
          ),
        )
      ],
    );
  }
}
