import 'package:flutter/material.dart';
import 'package:hosanna/main.dart';
import 'package:hosanna/utlilities/Strings.dart';
import 'package:hosanna/utlilities/theme.dart';
import 'package:hosanna/widgets/ui/reactions.dart';
import 'package:hosanna/model/post.dart';
import 'package:get/get.dart';

class PostDetails extends StatefulWidget {
  @override
  _PostDetailsState createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  PostModel post = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        elevation: 0.5,
        iconTheme: IconThemeData(
          color: ColorTheme.darkColor,
        ),
        title: Container(
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://i.pravatar.cc/100',
                  ),
                  backgroundColor: ColorTheme.primaryColor,
                ),
                margin: EdgeInsets.only(right: 10),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      // 'Grant Marshal',
                      post.title,
                      style: ColorTheme.secondaryHeading(),
                    ),
                    Row(
                      children: [
                        Text(
                          post.parsedTime,
                          style: ColorTheme.bodySmall(
                            ColorTheme.lightColor,
                          ),
                        ),
                        Text('.'),
                        Icon(
                          Icons.language,
                          size: 16,
                          color: ColorTheme.lightColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.more_vert,
                  size: 22,
                  color: ColorTheme.darkColor,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(25),
                    child: Text(
                      post.description,
                      style: ColorTheme.bodyText(),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: 2),
                    height: 200,
                    child: Image.network(
                      'https://picsum.photos/300/200',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 200,
                    margin: EdgeInsets.only(bottom: 2),
                    child: Image.network(
                      'https://picsum.photos/300/201',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 200,
                    margin: EdgeInsets.only(bottom: 2),
                    child: Image.network(
                      'https://picsum.photos/300/202',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 50),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 25,
              left: 25,
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width - 50,
                decoration: ColorTheme.cardDecoration(false, 50),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 0),
                  child: Reactions(post: post,),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
