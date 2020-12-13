import 'package:flutter/material.dart';
import 'package:hosanna/widgets/ui/event_card.dart';
import 'package:hosanna/utlilities/shared_pref_manager.dart';
import 'package:hosanna/model/post.dart';
import 'package:get/get.dart';
import 'package:hosanna/utlilities/loader.dart';
import 'package:hosanna/utlilities/Strings.dart';
import 'package:hosanna/utlilities/helper.dart';
import 'package:hosanna/utlilities/request.dart';

class UpcomingEvents extends StatefulWidget {
  @override
  _UpcomingEventsState createState() => _UpcomingEventsState();
}

class _UpcomingEventsState extends State<UpcomingEvents> {

  bool isLoading=false;
  List<PostModel> posts =[];

  @override
  void initState() {
    getEvents();
  }

  Future getEvents() async {
    isLoading = true;
    setState(() {

    });
    String token = await SharedPrefManager.getString(SharedPrefManager.token);
    print("token ${token}");
    Request request = Request(
      Strings.baseURL + Strings.allPosts,
      {"type": 2},
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
        itemCount: posts.length,
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
        itemBuilder: (BuildContext context, int index) {
          return EventCard(posts[index]);
        },
      ),
    );
  }
}
