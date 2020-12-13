import 'package:flutter/material.dart';
import 'package:hosanna/main.dart';
import 'package:hosanna/pages/common/post_details.dart';
import 'package:hosanna/utlilities/helper.dart';
import 'package:hosanna/utlilities/theme.dart';
import 'package:hosanna/widgets/ui/feed_card.dart';
import 'package:hosanna/utlilities/Strings.dart';
import 'package:hosanna/utlilities/helper.dart';
import 'package:hosanna/utlilities/request.dart';
import 'package:hosanna/utlilities/shared_pref_manager.dart';
import 'package:hosanna/widgets/ui/reactions.dart';
import 'package:hosanna/model/post.dart';
import 'package:get/get.dart';
import 'package:hosanna/utlilities/loader.dart';

import 'package:hosanna/model/post.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  bool isLoading=false;
  List<PostModel> posts =[];

  @override
  void initState() {
    getPosts();
  }

  Future getPosts() async {
    isLoading = true;
    setState(() {

    });
    String token = await SharedPrefManager.getString(SharedPrefManager.token);
    print("token ${token}");
    Request request = Request(
      Strings.baseURL + Strings.allPosts,
      {},
      token,
    );
    request.post().then((response) {
      if (isLoading) {
        isLoading = false;
      }
      setState(() {

      });
      print(response);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response);

        var data = response.data['details'];
        for (var i = 0; i < data.length; i++) {
          posts.add(
            PostModel.fromJson(
              response.data['details'][i],
            ),
          );
        }

      } else {
        isLoading = false;
        Get.snackbar('Error', response.data['message']);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Loader(
      inAsyncCall: isLoading,
      child: ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: posts.length,
        cacheExtent: 2,
        padding: EdgeInsets.only(bottom: 25),
        itemBuilder: (context, index) {
          return FeedCard(
            post: posts[index],
            // name: faker.person.name(),
            name: posts[index].createdByTitle,
            text: posts[index].description,
            // time: '${index * 3}h',
            time: posts[index].parsedTime,
            userImage: 'https://i.pravatar.cc/10$index',
            onTap: () {
              Get.put(posts[index]);
              Helper.to(PostDetails());
            },
          );
        },
      ),
    );
  }

}
