import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hosanna/model/user.dart';
import 'package:hosanna/utlilities/Strings.dart';
import 'package:hosanna/utlilities/helper.dart';
import 'package:hosanna/utlilities/loader.dart';
import 'package:hosanna/utlilities/request.dart';
import 'package:hosanna/utlilities/shared_pref_manager.dart';
import 'package:hosanna/utlilities/theme.dart';
import 'package:hosanna/widgets/ui/appbar.dart';
import 'package:hosanna/widgets/ui/button.dart';
import 'package:hosanna/widgets/ui/circle_image.dart';
import 'package:hosanna/widgets/ui/custom_heading.dart';
import 'package:hosanna/widgets/ui/list_card.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mime_type/mime_type.dart';
// import 'package:file_picker/file_picker.dart';

class AddPost extends StatefulWidget {
  final String type;
  final String typeId;

  AddPost({@required this.type, @required this.typeId});

  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
// Properteis

  int privacy;
  String privacyText = 'Public';
  bool showInFeed = true;
  int eventIndex = 0;
  List<String> attachments;
  String tag;
  String description;
  int postType;
  User user;
  String selectedTag;
  String messageBody;
  final msgCtrl = TextEditingController();
  File _image;
  File _audioFile;
  File _video;
  File _coverImage;
  final picker = ImagePicker();
  List imageAttach = [];
  List vidAttach = [];
  List<File> images = [];
  List<File> videos = [];
  bool isLoading = false;
  File selectedImage;
  List<int> selectedImageBytes = [];
  List<int> selectedAudioBytes = [];
  List<int> coverImageBytes = [];
  String type;
  bool shareInPost = false;
  List<int> _videoBytes;

// Init state

  @override
  void initState() {
    super.initState();
    msgCtrl.addListener(setText);
    SharedPrefManager.getUser().then((data) {
      setState(() {
        user = data;
      });
    });
  }

// Dispose
  void dispose() {
    msgCtrl.dispose();
    super.dispose();
  }

// Set Text

  setText() {
    setState(() {
      messageBody = msgCtrl.text;
    });
  }

// Show Tag Selection Sheet

  showTagSheet() {
    Get.bottomSheet(Container(
      decoration: ColorTheme.cardDecoration(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 15,
              ),
              child: CustomHeading(
                title: 'Tags',
              ),
            ),
            ExpansionTile(
              initiallyExpanded: true,
              title: Row(
                children: [
                  Text(
                    'Daily Devotion',
                    style: ColorTheme.bodyText(ColorTheme.darkColor, 1),
                  ),
                ],
              ),
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.radio_button_unchecked,
                          color: ColorTheme.primaryColor,
                        ),
                        title: Text(
                          'Today\'s Blessing',
                          style: ColorTheme.bodyText(ColorTheme.darkColor, 1),
                        ),
                        trailing: Icon(
                          Icons.chevron_right,
                        ),
                        onTap: () {
                          setState(() {
                            selectedTag = 'Todays Blessing';
                            Navigator.pop(context);
                          });
                        },
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.radio_button_unchecked,
                          color: ColorTheme.primaryColor,
                        ),
                        title: Text(
                          'Today\'s Prayers',
                          style: ColorTheme.bodyText(ColorTheme.darkColor, 1),
                        ),
                        trailing: Icon(
                          Icons.chevron_right,
                        ),
                        onTap: () {
                          setState(() {
                            selectedTag = 'Todays Prayers';
                            Navigator.pop(context);
                          });
                        },
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.radio_button_unchecked,
                          color: ColorTheme.primaryColor,
                        ),
                        title: Text(
                          'Today\'s Scriptures',
                          style: ColorTheme.bodyText(ColorTheme.darkColor, 1),
                        ),
                        trailing: Icon(
                          Icons.chevron_right,
                        ),
                        onTap: () {
                          setState(() {
                            selectedTag = 'Todays Scriptures';
                            Navigator.pop(context);
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ListTile(
              leading: Icon(
                Icons.radio_button_unchecked,
                color: ColorTheme.primaryColor,
              ),
              title: Text(
                'Prayer',
                style: ColorTheme.bodyText(ColorTheme.darkColor, 1),
              ),
              trailing: Icon(
                Icons.chevron_right,
              ),
              onTap: () {
                setState(() {
                  selectedTag = 'Prayer';
                  Navigator.pop(context);
                });
              },
            ),
            Divider(
              height: 2,
              color: Colors.grey.withAlpha(100),
            ),
            ListTile(
              leading: Icon(
                Icons.radio_button_unchecked,
                color: ColorTheme.primaryColor,
              ),
              title: Text(
                'Announcement',
                style: ColorTheme.bodyText(ColorTheme.darkColor, 1),
              ),
              trailing: Icon(
                Icons.chevron_right,
              ),
              onTap: () {
                setState(() {
                  selectedTag = 'Announcment';
                  Navigator.pop(context);
                });
              },
            ),
          ],
        ),
      ),
    ));
  }

// Select Attachment

  selectAttachment() {
    Get.bottomSheet(Container(
      height: 250,
      decoration: ColorTheme.cardDecoration(),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 15,
            ),
            child: CustomHeading(
              title: 'Select Attachment',
            ),
          ),
          ListCard(
            color: Colors.orange,
            title: 'Image',
            icon: MdiIcons.image,
            noDecoration: true,
            onTap: () {
              Navigator.pop(context);
              selectImage();
            },
          ),
          ListCard(
            color: Colors.purple,
            title: 'Video',
            noDecoration: true,
            icon: MdiIcons.video,
            onTap: () {
              Navigator.pop(context);
              selectVideo();
            },
          ),
        ],
      ),
    ));
  }

// Select Image

  selectImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        List<int> imageBytes = _image.readAsBytesSync();
        imageAttach.add(imageBytes);

        print('imageBytes ${imageBytes.length}');
        images.add(_image);
        setState(() {
          selectedImageBytes = imageBytes;
          type = mime(pickedFile.path);
        });
      } else {
        print('No image selected.');
      }
    });
  }

// Select Cover Image

  selectCoverImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _coverImage = File(pickedFile.path);
        List<int> imageBytes = _coverImage.readAsBytesSync();
        setState(() {
          coverImageBytes = imageBytes;
          type = mime(pickedFile.path);
        });
      } else {
        print('No image selected.');
      }
    });
  }

// ImageAttachments

  Widget imageAttachments() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: images.length,
      scrollDirection: Axis.horizontal,
      physics: ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(right: 15),
          child: Stack(
            overflow: Overflow.visible,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: ColorTheme.cardDecoration(),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.file(
                    (images[index])??"",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                right: -10,
                top: -10,
                child: InkWell(
                  onTap: () {
                    imageAttach.removeAt(index);
                    images.removeAt(index);
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

// Video Attachments

  Widget videoAttachments() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: videos.length,
      scrollDirection: Axis.horizontal,
      physics: ClampingScrollPhysics(),
      padding: EdgeInsets.only(right: 15),
      itemBuilder: (context, index) {
        return Stack(
          overflow: Overflow.visible,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: ColorTheme.cardDecoration(),
              child: Center(
                child: Icon(
                  MdiIcons.video,
                  color: ColorTheme.primaryColor,
                ),
              ),
            ),
            Positioned(
              right: -10,
              top: -10,
              child: InkWell(
                onTap: () {
                  vidAttach.removeAt(index);
                  videos.removeAt(index);
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

// Select Video

  selectVideo() async {
    final pickedFile = await picker.getVideo(source: ImageSource.gallery);
    if (pickedFile != null) {
      _video = File(pickedFile.path);
      _videoBytes = _video.readAsBytesSync();
      vidAttach.add(_videoBytes);
      videos.add(_video);
      print('video selected.');
      // print('video path ${images[0].uri}.');
    } else {
      print('No image selected.');
    }
    setState(() {

    });
  }

// Select File

  selectAudio() async {
    // File file = await FilePicker.getFile(type: FileType.audio);
    // if (file != null) {
    //   _audioFile = File(file.path);
    //   List<int> audioBytes = _audioFile.readAsBytesSync();
    //   selectedAudioBytes = audioBytes;
    // }
    // FilePickerResult result = await FilePicker.platform.pickFiles();
    //
    // if(result != null) {
    //   File file = File(result.files.single.path);
    //     List<int> audioBytes = _audioFile.readAsBytesSync();
    //     selectedAudioBytes = audioBytes;
    // } else {
    //   // User canceled the picker
    // }
  }

// Send Post

  sendPost() async {
    if (msgCtrl.text.length == 0) {
      Helper.showMessage('Message cannot be empty', context);
    } else {
      FocusScope.of(context).requestFocus(new FocusNode());
      setState(() {
        isLoading = true;
      });

      var attachments = [];

      // try{
        for (var i = 0; i < imageAttach.length; i++) {
        attachments.add(
            {
              "title": null,
              "thumbnail": null,
              "extension":null,// images[i].path,
              "file": base64.encode(imageAttach[i]),
            },
        );
      }
      // }catch(e){print("Error: ${e.toString()}");}

      try{for (var i = 0; i < vidAttach.length; i++) {
        attachments.add(
            {
              "title": null,
              "thumbnail": null,
              "extension": videos[i].path,
              "file": base64.encode(vidAttach[i]),
            },
        );
      }}catch(e){print("Error: ${e.toString()}");}
      try{}catch(e){print("Error: ${e.toString()}");}

      var data = json.encode({
          "attachments": attachments,
          "privacy": privacyText,
          "tag": selectedTag,
          "description": msgCtrl.text,
          "post_type": widget.typeId,

      });
      String token = await SharedPrefManager.getString(SharedPrefManager.token);

      Request request = Request(
        Strings.baseURL + Strings.postCreate,
        data,
        token,
      );
      print("request to be sent ; ${request.body.toString()}");
      request.post().then((response) {
        print(response);
        if (response.statusCode == 200 || response.statusCode == 201) {
          print(response);
          setState(() {
            isLoading = false;
          });
          Navigator.pop(context);
          Helper.showMessage(
            'Post added successfully',
            context,
            true,
          );

          // Helper.off(HomePage());
        } else {
          setState(() {
            isLoading = false;
          });
          print(response.data);
          Helper.showMessage(response.data['message'], context);
        }
      });
    }
  }

// Build
  @override
  Widget build(BuildContext context) {
    return Loader(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: CustomAppbar(
          title: 'Add ${widget.type}',
          bgColor: Colors.white,
          brightness: Brightness.light,
          iconColor: ColorTheme.darkColor,
          isCenter: false,
          actions: [
            widget.type.toLowerCase() != 'event' &&
                    widget.type.toLowerCase() != 'post'
                ? FlatButton(
                    child: Text(
                      'Publish',
                      style: ColorTheme.bodyText(ColorTheme.primaryColor, 1),
                    ),
                    onPressed: () {

                    },
                  )
                : Container()
          ],
        ),
        body: SingleChildScrollView(
            child: widget.type.toLowerCase() == 'post'
                ? regularPost()
                : widget.type.toLowerCase() == 'event'
                    ? eventPost()
                    : otherPosts()),
        bottomNavigationBar: widget.type.toLowerCase() == 'post'
            ? Container(
                decoration: ColorTheme.cardDecoration(),
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            margin: EdgeInsets.only(right: 15),
                            decoration: BoxDecoration(
                              color: Colors.purple.withAlpha(40),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: IconButton(
                              icon: Icon(
                                MdiIcons.movieFilter,
                                color: Colors.purple,
                              ),
                              onPressed: () {
                                selectAttachment();
                              },
                            ),
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.orange.withAlpha(40),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: IconButton(
                              icon: Icon(
                                MdiIcons.tag,
                                color: Colors.orange,
                              ),
                              onPressed: () {
                                showTagSheet();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    CustomButton(
                      color: ColorTheme.primaryColor,
                      title: 'Post',
                      hasBorder: false,
                      height: 40,
                      margin: EdgeInsets.all(0),
                      textColor: Colors.white,
                      isRound: true,
                      onTap: () {
                        sendPost();
                      },
                      padding: EdgeInsets.symmetric(horizontal: 40),
                    ),
                  ],
                ),
              )
            : widget.type.toLowerCase() == 'event'
                ? Container(
                    decoration: ColorTheme.cardDecoration(),
                    padding: EdgeInsets.all(5),
                    height: 80,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Container(
                          height: 15,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                  child: LinearProgressIndicator(
                                    backgroundColor:
                                        ColorTheme.lightColor.withAlpha(30),
                                    minHeight: 5,
                                    value: eventIndex == 0 ? 100 : 100,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                  child: LinearProgressIndicator(
                                    backgroundColor:
                                        ColorTheme.lightColor.withAlpha(30),
                                    minHeight: 5,
                                    value: 0,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                  child: LinearProgressIndicator(
                                    backgroundColor:
                                        ColorTheme.lightColor.withAlpha(30),
                                    minHeight: 5,
                                    value: 0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: eventIndex >= 2
                              ? () {
                                  Navigator.pop(context);
                                }
                              : () {
                                  setState(() {
                                    eventIndex++;
                                  });
                                },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: ColorTheme.primaryColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text(
                                eventIndex >= 2 ? 'Post' : 'Next',
                                style: ColorTheme.bodyText(Colors.white, 1),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                : null,
      ),
    );
  }

// Add Photo

  addPhoto() async {
    setState(() {
      isLoading = true;
    });
    var data = json.encode({
      "attachments": [
        {
          "title": null,
          "thumbnail": null,
          "thumbnail_extension": null,
          "extension": type,
          "file": base64.encode(selectedImageBytes),
        }
      ],
      "shared_in_post": shareInPost,
      "privacy": privacy == 1 ? "Private" : "Public",
      "post_type": widget.type
    });
    String token = await SharedPrefManager.getString(SharedPrefManager.token);

    Request request = Request(
      Strings.baseURL + Strings.postCreate,
      data,
      token,
    );
    print("Request: ${request.toString()}");
    request.post().then((response) {
      print(response);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response);
        setState(() {
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
        print(response.data);
        Helper.showMessage(response.data['message'], context);
      }
    });
  }

// Add Video

  addVideo() async {
    setState(() {
      isLoading = true;
    });
    var data = json.encode({
      "attachments": [
        {
          "title": "music tital",
          "thumbnail": "",
          "thumbnail_extension": '',
          "file": _video.readAsBytesSync(),
          "extension": mime(_video.path),
        }
      ],
      "shared_in_post": shareInPost,
      "privacy": privacy == 0 ? 'public' : 'private',
      "post_type": widget.typeId,
    });
    String token = await SharedPrefManager.getString(SharedPrefManager.token);

    Request request = Request(
      Strings.baseURL + Strings.postCreate,
      data,
      token,
    );
    request.post().then((response) {
      print(response);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response);
        setState(() {
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
        print(response.data);
        Helper.showMessage(response.data['message'], context);
      }
    });
  }

// Add Music

  addMusic() async {
    setState(() {
      isLoading = true;
    });
    var data = json.encode({
      "attachments": [
        {
          "title": "music tital",
          "thumbnail": "",
          "thumbnail_extension": '',
          "file": _audioFile.readAsBytesSync(),
          "extension": mime(_audioFile.path),
        }
      ],
      "shared_in_post": shareInPost,
      "privacy": privacy == 0 ? 'public' : 'private',
      "post_type": widget.typeId,
    });
    String token = await SharedPrefManager.getString(SharedPrefManager.token);

    Request request = Request(
      Strings.baseURL + Strings.postCreate,
      data,
      token,
    );
    request.post().then((response) {
      print(response);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response);
        setState(() {
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
        print(response.data);
        Helper.showMessage(response.data['message'], context);
      }
    });
  }

// 1. Regular Post

  Widget regularPost() {
    return Container(
      decoration: ColorTheme.cardDecoration(),
      padding: EdgeInsets.all(25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CustomCircleImage(
                width: 50,
                height: 50,
                url: 'https://i.pravatar.cc/100',
                shape: BoxShape.circle,
              ),
              Container(
                margin: EdgeInsets.only(left: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user != null && user.name != null
                          ? user.name
                          : 'no name found',
                      style: ColorTheme.secondaryHeading(
                        ColorTheme.darkColor,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 5),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.bottomSheet(
                                Container(
                                  height: 250,
                                  decoration: ColorTheme.cardDecoration(),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 15,
                                        ),
                                        child: CustomHeading(
                                          title: 'Privacy',
                                        ),
                                      ),
                                      ListCard(
                                        color: ColorTheme.primaryColor,
                                        icon: MdiIcons.eye,
                                        title: 'Public',
                                        noDecoration: true,
                                        onTap: () {
                                          setState(() {
                                            privacyText = 'Public';
                                            Navigator.pop(context);
                                          });
                                        },
                                      ),
                                      ListCard(
                                        color: ColorTheme.primaryColor,
                                        icon: MdiIcons.lock,
                                        title: 'Private',
                                        noDecoration: true,
                                        onTap: () {
                                          setState(() {
                                            privacyText = 'Private';
                                            Navigator.pop(context);
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: ColorTheme.lightColor,
                                ),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 2,
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    MdiIcons.circleBoxOutline,
                                    size: 15,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 5),
                                  ),
                                  Text(
                                    privacyText,
                                    style: ColorTheme.bodySmall(
                                        ColorTheme.lightColor),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 5),
                                  ),
                                  Icon(
                                    MdiIcons.chevronDown,
                                    size: 15,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                          ),
                          InkWell(
                            onTap: () {
                              showTagSheet();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: ColorTheme.lightColor,
                                ),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 2,
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    MdiIcons.handHeart,
                                    size: 15,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 5),
                                  ),
                                  Text(
                                    selectedTag != null
                                        ? selectedTag
                                        : 'Select Tag',
                                    style: ColorTheme.bodySmall(
                                        ColorTheme.lightColor),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 5),
                                  ),
                                  Icon(
                                    MdiIcons.chevronDown,
                                    size: 15,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 25),
          ),
          TextFormField(
            minLines: 10,
            maxLines: 20,
            controller: msgCtrl,
            textInputAction: TextInputAction.done,
            onFieldSubmitted: (e) {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            decoration:
                InputDecoration.collapsed(hintText: 'What\'s on your mind!'),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15),
          ),
          Container(
            height: 100,
            child: Row(
              children: [
                imageAttachments(),
                videoAttachments(),
              ],
            ),
          ),
        ],
      ),
    );
  }

// 2. Video Post

  Widget otherPosts() {
    return Container(
      width: double.infinity,
      decoration: ColorTheme.cardDecoration(),
      padding: EdgeInsets.all(25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: ColorTheme.primaryColor.withAlpha(50),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Icon(
                MdiIcons.gift,
                color: ColorTheme.primaryColor,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15),
          ),
          Text(
            'Upload New ${int.parse(widget.typeId) == 3 ? "Photo" : int.parse(widget.typeId) == 4 ? "Video" : int.parse(widget.typeId) == 5 ? "Music" : "Null"}',
            style: ColorTheme.secondaryHeading(
              ColorTheme.darkColor,
              1.5,
            ),
          ),
          Text(
            'Please use button below to upload a ${widget.type}',
            style: ColorTheme.bodyText(
              ColorTheme.lightColor,
              2,
            ),
          ),
          Container(
            width: 200,
            child: CustomButton(
              hasBorder: false,
              color: ColorTheme.primaryColor.withAlpha(50),
              title: 'Upload',
              height: 50,
              margin: EdgeInsets.symmetric(vertical: 15),
              textColor: ColorTheme.primaryColor,
              onTap: () {
                if (int.parse(widget.typeId) == 3) {
                  selectImage();
                } else if (int.parse(widget.typeId) == 4) {
                  selectVideo();
                } else if (int.parse(widget.typeId) == 5) {
                  selectAudio();
                } else if (int.parse(widget.typeId) == 6) {
                } else {}
              },
            ),
          ),
          int.parse(widget.typeId) != 3
              ? Container(
                  decoration: BoxDecoration(
                    color: ColorTheme.lightColor.withAlpha(20),
                    borderRadius: BorderRadius.circular(10),
                    image: _coverImage != null
                        ? DecorationImage(
                            image: AssetImage(_coverImage.path),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                  height: 150,
                  margin: EdgeInsets.symmetric(vertical: 15),
                  child: Center(
                    child: Container(
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                      ),
                      child: FlatButton(
                        onPressed: () {
                          selectCoverImage();
                        },
                        child: Text(
                          'Add Cover Image',
                          style: ColorTheme.bodyText(
                            ColorTheme.darkColor,
                            1,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : Container(),
          int.parse(widget.typeId) != 3
              ? Padding(
                  padding: EdgeInsets.only(bottom: 15),
                  child: TextFormField(
                    decoration: ColorTheme.borderInput(
                      ' ${int.parse(widget.typeId) == 3 ? "Photo" : int.parse(widget.typeId) == 4 ? "Video" : int.parse(widget.typeId) == 5 ? "Music" : "Null"} Title',
                      5,
                      ColorTheme.lightColor.withAlpha(80),
                      MdiIcons.accountCircle,
                    ),
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (e) {},
                  ),
                )
              : Container(),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: ColorTheme.lightColor.withAlpha(40),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  MdiIcons.eye,
                  color: ColorTheme.lightColor.withAlpha(80),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                ),
                Expanded(
                  child: DropdownButtonFormField(
                      isExpanded: true,
                      value: privacy,
                      style: ColorTheme.bodyText(ColorTheme.lightColor, 1),
                      decoration: InputDecoration.collapsed(
                        hintText: 'Select Privacy',
                      ),
                      items: [
                        DropdownMenuItem(
                          child: Text("Public"),
                          value: 1,
                        ),
                        DropdownMenuItem(
                          child: Text("Private"),
                          value: 2,
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          privacy = value;
                        });
                      }),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15),
          ),
          Container(
            decoration: ColorTheme.cardDecoration(),
            child: CheckboxListTile(
              onChanged: (e) {
                setState(() {
                  showInFeed = !showInFeed;
                });
              },
              value: showInFeed,
              controlAffinity: ListTileControlAffinity.leading,
              title: Text(
                'Share this video in post',
                style: ColorTheme.bodyText(ColorTheme.darkColor, 1),
              ),
            ),
          ),
        ],
      ),
    );
  }

// Event Post

  Widget eventPost() {
    return eventIndex == 0
        ? Column(
            children: [
              Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    CustomHeading(
                      title: 'Event Type',
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 15),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(right: 15),
                            decoration: ColorTheme.cardDecoration(),
                            padding: EdgeInsets.all(25),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  margin: EdgeInsets.only(bottom: 15),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:
                                        ColorTheme.primaryColor.withAlpha(40),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      MdiIcons.laptop,
                                      color: ColorTheme.primaryColor,
                                    ),
                                  ),
                                ),
                                Text(
                                  'Online',
                                  style: ColorTheme.secondaryHeading(
                                    ColorTheme.darkColor,
                                    2,
                                  ),
                                ),
                                Text(
                                  'Get together with people through online either live streaming',
                                  style: ColorTheme.bodyText(
                                      ColorTheme.lightColor, 1.3),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: ColorTheme.cardDecoration(),
                            padding: EdgeInsets.all(25),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  margin: EdgeInsets.only(bottom: 15),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:
                                        ColorTheme.primaryColor.withAlpha(40),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      MdiIcons.accountGroup,
                                      color: ColorTheme.primaryColor,
                                    ),
                                  ),
                                ),
                                Text(
                                  'In Person',
                                  style: ColorTheme.secondaryHeading(
                                    ColorTheme.darkColor,
                                    2,
                                  ),
                                ),
                                Text(
                                  'Get together with people in specific location … ',
                                  style: ColorTheme.bodyText(
                                      ColorTheme.lightColor, 1.3),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  CustomHeading(
                    title: 'Event Information',
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                  ),
                  Container(
                    padding: EdgeInsets.all(25),
                    decoration: ColorTheme.cardDecoration(),
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: ColorTheme.borderInput(
                            'Event Title',
                            5,
                            ColorTheme.lightColor.withAlpha(80),
                            MdiIcons.pencil,
                          ),
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (e) {},
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 15),
                        ),
                        TextFormField(
                          decoration: ColorTheme.borderInput(
                            'Event Date',
                            5,
                            ColorTheme.lightColor.withAlpha(80),
                            MdiIcons.calendar,
                          ),
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (e) {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 15),
              ),
              Column(
                children: [
                  CustomHeading(
                    title: 'Privacy',
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                  ),
                  Container(
                    padding: EdgeInsets.all(25),
                    decoration: ColorTheme.cardDecoration(),
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: ColorTheme.lightColor.withAlpha(40),
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            MdiIcons.eye,
                            color: ColorTheme.lightColor.withAlpha(80),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                          ),
                          Expanded(
                            child: DropdownButtonFormField(
                                isExpanded: true,
                                value: privacy,
                                style: ColorTheme.bodyText(
                                    ColorTheme.lightColor, 1),
                                decoration: InputDecoration.collapsed(
                                  hintText: 'Select Privacy',
                                ),
                                items: [
                                  DropdownMenuItem(
                                    child: Text("Public"),
                                    value: 1,
                                  ),
                                  DropdownMenuItem(
                                    child: Text("Private"),
                                    value: 2,
                                  ),
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    privacy = value;
                                  });
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        : eventIndex > 0 && eventIndex < 2
            ? Column(
                children: [
                  CustomHeading(
                    title: 'Location',
                  ),
                  Text(
                    'Enter physical location where users can attend the event',
                    style: ColorTheme.bodyText(ColorTheme.lightColor, 1),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15),
                  ),
                  Container(
                    padding: EdgeInsets.all(25),
                    decoration: ColorTheme.cardDecoration(),
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: ColorTheme.borderInput(
                            'Event Location',
                            5,
                            ColorTheme.lightColor.withAlpha(80),
                            MdiIcons.pencil,
                          ),
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (e) {},
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : eventIndex >= 2
                ? Container(
                    margin: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Container(
                          decoration: ColorTheme.cardDecoration(),
                          padding: EdgeInsets.all(15),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      child: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                          'https://i.pravatar.cc/100',
                                        ),
                                        backgroundColor:
                                            ColorTheme.primaryColor,
                                      ),
                                      margin: EdgeInsets.only(right: 10),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'SUN, AT 11:00 AM – 12:00 PM',
                                            style: ColorTheme.bodySmall(
                                                ColorTheme.primaryColor),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(bottom: 5),
                                          ),
                                          Text(
                                            'Christmas Celebration',
                                            style:
                                                ColorTheme.secondaryHeading(),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(bottom: 5),
                                          ),
                                          Text(
                                            'Winston Church',
                                            style: ColorTheme.bodySmall(
                                              ColorTheme.lightColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 50,
                                      height: 55,
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .primaryColor
                                            .withAlpha(30),
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            '11',
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            'OCT'.toUpperCase(),
                                            style: ColorTheme.bodySmall(
                                              ColorTheme.darkColor,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: ColorTheme.lightColor.withAlpha(20),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                height: 150,
                                margin: EdgeInsets.symmetric(vertical: 15),
                                child: Center(
                                  child: Container(
                                    width: 150,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.white,
                                    ),
                                    child: FlatButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Add Cover Image',
                                        style: ColorTheme.bodyText(
                                          ColorTheme.darkColor,
                                          1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 15),
                              ),
                              ListCard(
                                color: Colors.purple,
                                title: 'Description',
                                subtitle: 'Add Description',
                                onTap: () {},
                                noDecoration: true,
                                icon: MdiIcons.file,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 15),
                              ),
                              ListCard(
                                color: Colors.orange,
                                title: 'Event Type',
                                subtitle: 'Online - Hosana Live',
                                onTap: () {},
                                noDecoration: true,
                                icon: MdiIcons.tag,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 15),
                              ),
                              ListCard(
                                color: Colors.indigo,
                                title: 'Event Privacy',
                                subtitle: 'Public Event',
                                onTap: () {},
                                noDecoration: true,
                                icon: MdiIcons.eye,
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          decoration: ColorTheme.cardDecoration(),
                          child: CheckboxListTile(
                            onChanged: (e) {
                              setState(() {
                                showInFeed = !showInFeed;
                              });
                            },
                            value: showInFeed,
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Text(
                              'Share this video in post',
                              style:
                                  ColorTheme.bodyText(ColorTheme.darkColor, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Container();
  }
}
