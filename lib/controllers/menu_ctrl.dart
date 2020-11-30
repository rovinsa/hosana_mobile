import 'package:get/state_manager.dart';
import 'package:flutter/material.dart';
import 'package:hosanna/pages/tabs/events.dart';
import 'package:hosanna/pages/tabs/feed.dart';
import 'package:hosanna/pages/tabs/media.dart';
import 'package:hosanna/pages/tabs/more.dart';
import 'package:hosanna/pages/tabs/profile.dart';

class MenuController extends GetxController {
// Properties
  Widget activePage = Feed();
  int index = 0;

// Set Active Page

  setActivePage(int newIndex) {
    index = newIndex;
    print("old $index  : New : $newIndex");
    switch (newIndex) {
      case 0:
        {
          activePage = Feed();
        }
        break;

      case 1:
        {
          activePage = EventsPage();
        }
        break;

      case 2:
        {
          activePage = Media();
        }
        break;

      case 3:
        {
          activePage = Profile();
        }
        break;

      case 4:
        {
          activePage = More();
        }
        break;

      default:
        {
          activePage = Feed();
        }
        break;
    }
    update();
  }
}
