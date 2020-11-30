import 'package:flutter/material.dart';
import 'package:flutter_fab_dialer/flutter_fab_dialer.dart';
import 'package:get/get.dart';
import 'package:hosanna/model/post_type.dart';
import 'package:hosanna/model/user.dart';
import 'package:hosanna/pages/church/add_post.dart';
import 'package:hosanna/utlilities/Strings.dart';
import 'package:hosanna/utlilities/helper.dart';
import 'package:hosanna/utlilities/request.dart';
import 'package:hosanna/utlilities/shared_pref_manager.dart';

class AppController extends GetxController {
// Properteis
  final appUser = User().obs;
  bool isLoading = false;
  List<PostType> postTypes = [];
  List<FabMiniMenuItem> fabMiniMenuItemList = [];

// Check Logged In

  checkLoggedIn() async {
    await SharedPrefManager.getUser().then((user) {
      if (user.name != null) {
        appUser.update((val) {
          val.name = user.name;
          val.email = user.email;
          val.id = user.id;
          val.country = user.country;
          val.phone = user.phone;
          val.type = user.type;
          val.username = user.username;
        });
      }
    });
    update();
  }

// Fetch Post Types

  Future getPostTypes() async {
    isLoading = true;
    update();
    String token = await SharedPrefManager.getString(SharedPrefManager.token);
    Request request = Request(
      Strings.baseURL + Strings.postTypes,
      {},
      token,
    );
    request.post().then((response) {
      if (isLoading) {
        isLoading = false;
      }
      update();
      print(response);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response);

        var data = response.data['details'];
        for (var i = 0; i < data.length; i++) {
          postTypes.add(
            PostType.fromJson(
              response.data['details'][i],
            ),
          );
        }
        for (var i = 0; i < postTypes.length; i++) {
          fabMiniMenuItemList.add(FabMiniMenuItem.withText(
            Icon(Icons.attachment),
            Colors.red,
            4.0,
            postTypes[i].title,
            () {
              Helper.to(AddPost(
                type: 'resource',
                typeId: postTypes[i].id.toString(),
              ));
            },
            "Resources",
            Colors.red,
            Colors.white,
            true,
          ));
        }
        update();
      } else {
        isLoading = false;
        update();
        Get.snackbar('Error', response.data['message']);
      }
    });
  }
}
