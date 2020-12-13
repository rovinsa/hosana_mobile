import 'package:flutter/material.dart';
import 'package:hosanna/utlilities/theme.dart';
import 'package:hosanna/model/post.dart';

class Reactions extends StatelessWidget {
  PostModel post;

  Reactions({this.post});

  @override
  Widget build(BuildContext context) {
    post=post??PostModel(hallelujah: 0,amen: 0,praise: 0,likes: 0);
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        margin: EdgeInsets.symmetric(vertical: 5),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 30,
                decoration: BoxDecoration(
                  color: ColorTheme.blue.withAlpha(40),
                  borderRadius: BorderRadius.circular(25),
                ),
                margin: EdgeInsets.symmetric(horizontal: 5),
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/img/like.png',
                      width: 15,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        '${post.likes}',
                        style: ColorTheme.bodyText(
                          ColorTheme.blue,
                          1,
                          true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 30,
                decoration: BoxDecoration(
                  color: ColorTheme.yellow.withAlpha(60),
                  borderRadius: BorderRadius.circular(25),
                ),
                margin: EdgeInsets.symmetric(horizontal: 5),
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/img/hands.png',
                      width: 20,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        '${post.hallelujah}',
                        style: ColorTheme.bodyText(
                          ColorTheme.warning,
                          1,
                          true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 30,
                decoration: BoxDecoration(
                  color: ColorTheme.red.withAlpha(40),
                  borderRadius: BorderRadius.circular(25),
                ),
                margin: EdgeInsets.symmetric(horizontal: 5),
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/img/pray.png',
                      width: 20,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        '${post.amen}',
                        style: ColorTheme.bodyText(
                          ColorTheme.red,
                          1,
                          true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 30,
                decoration: BoxDecoration(
                  color: ColorTheme.brown.withAlpha(40),
                  borderRadius: BorderRadius.circular(25),
                ),
                margin: EdgeInsets.symmetric(horizontal: 5),
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/img/cross.png',
                      width: 17,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        '${post.praise}',
                        style: ColorTheme.bodyText(
                          ColorTheme.brown,
                          1,
                          true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
