import 'package:flutter/material.dart';
import 'package:hosanna/main.dart';
import 'package:hosanna/pages/common/post_details.dart';
import 'package:hosanna/utlilities/helper.dart';
import 'package:hosanna/utlilities/theme.dart';
import 'package:hosanna/widgets/ui/feed_card.dart';
import 'package:hosanna/widgets/ui/reactions.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemCount: 3,
      cacheExtent: 2,
      padding: EdgeInsets.only(bottom: 25),
      itemBuilder: (context, index) {
        return FeedCard(
          name: faker.person.name(),
          text: faker.lorem.sentence(),
          time: '${index * 3}h',
          userImage: 'https://i.pravatar.cc/10$index',
          onTap: () {
            Helper.to(PostDetails());
          },
        );
      },
    );
  }
}
