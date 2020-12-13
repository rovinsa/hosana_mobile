
class PostModel {
  int _id;
  String _title;
  String _description;
  int _postType;
  String _postTypeTitle;
  int _createdBy;
  String _createdByTitle;
  String _createdByPicture;
  String _privacy;
  String _date;
  String _address;
  String _startTime;
  String _endTime;
  String _lat;
  String _lng;
  String _streamType;
  int _likes;
  int _praise;
  int _amen;
  int _hallelujah;
  String _parsedTime;
  String _parsedDate;
  String _parsedMonth;
  List<String> _attachments;
  List<String> _thumbnails;

  PostModel(
      {int id,
        String title,
        String description,
        int postType,
        String postTypeTitle,
        int createdBy,
        String createdByTitle,
        String createdByPicture,
        String privacy,
        String date,
        String address,
        String startTime,
        String endTime,
        String lat,
        String lng,
        String streamType,
        int likes,
        int praise,
        int amen,
        int hallelujah,
        String parsedTime,
        String parsedDate,
        String parsedMonth,
        List<String> attachments,
        List<String> thumbnails}) {
    this._id = id;
    this._title = title;
    this._description = description;
    this._postType = postType;
    this._postTypeTitle = postTypeTitle;
    this._createdBy = createdBy;
    this._createdByTitle = createdByTitle;
    this._createdByPicture = createdByPicture;
    this._privacy = privacy;
    this._date = date;
    this._address = address;
    this._startTime = startTime;
    this._endTime = endTime;
    this._lat = lat;
    this._lng = lng;
    this._streamType = streamType;
    this._likes = likes;
    this._praise = praise;
    this._amen = amen;
    this._hallelujah = hallelujah;
    this._parsedTime = parsedTime;
    this._parsedDate = parsedDate;
    this._parsedMonth = parsedMonth;
    this._attachments = attachments;
    this._thumbnails = thumbnails;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get title => _title;
  set title(String title) => _title = title;
  String get description => _description;
  set description(String description) => _description = description;
  int get postType => _postType;
  set postType(int postType) => _postType = postType;
  String get postTypeTitle => _postTypeTitle;
  set postTypeTitle(String postTypeTitle) => _postTypeTitle = postTypeTitle;
  int get createdBy => _createdBy;
  set createdBy(int createdBy) => _createdBy = createdBy;
  String get createdByTitle => _createdByTitle;
  set createdByTitle(String createdByTitle) => _createdByTitle = createdByTitle;
  String get createdByPicture => _createdByPicture;
  set createdByPicture(String createdByPicture) =>
      _createdByPicture = createdByPicture;
  String get privacy => _privacy;
  set privacy(String privacy) => _privacy = privacy;
  String get date => _date;
  set date(String date) => _date = date;
  String get address => _address;
  set address(String address) => _address = address;
  String get startTime => _startTime;
  set startTime(String startTime) => _startTime = startTime;
  String get endTime => _endTime;
  set endTime(String endTime) => _endTime = endTime;
  String get lat => _lat;
  set lat(String lat) => _lat = lat;
  String get lng => _lng;
  set lng(String lng) => _lng = lng;
  String get streamType => _streamType;
  set streamType(String streamType) => _streamType = streamType;
  int get likes => _likes;
  set likes(int likes) => _likes = likes;
  int get praise => _praise;
  set praise(int praise) => _praise = praise;
  int get amen => _amen;
  set amen(int amen) => _amen = amen;
  int get hallelujah => _hallelujah;
  set hallelujah(int hallelujah) => _hallelujah = hallelujah;
  String get parsedTime => _parsedTime;
  set parsedTime(String parsedTime) => _parsedTime = parsedTime;
  String get parsedDate => _parsedDate;
  set parsedDate(String parsedDate) => _parsedDate = parsedDate;
  String get parsedMonth => _parsedMonth;
  set parsedMonth(String parsedMonth) => _parsedMonth = parsedMonth;
  List<String> get attachments => _attachments;
  set attachments(List<String> attachments) => _attachments = attachments;
  List<String> get thumbnails => _thumbnails;
  set thumbnails(List<String> thumbnails) => _thumbnails = thumbnails;

  PostModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _title = json['title'];
    _description = json['description'];
    _postType = json['post_type'];
    _postTypeTitle = json['post_type_title'];
    _createdBy = json['created_by'];
    _createdByTitle = json['created_by_title'];
    _createdByPicture = json['created_by_picture'];
    _privacy = json['privacy'];
    _date = json['date'];
    _address = json['address'];
    _startTime = json['start_time'];
    _endTime = json['end_time'];
    _lat = json['lat'];
    _lng = json['lng'];
    _streamType = json['stream_type'];
    _likes = json['likes'];
    _praise = json['praise'];
    _amen = json['amen'];
    _hallelujah = json['hallelujah'];
    _parsedTime = json['parsed_time'];
    _parsedDate = json['parsed_date'];
    _parsedMonth = json['parsed_month'];
    _attachments = json['attachments'].cast<String>();
    _thumbnails = json['thumbnails'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['title'] = this._title;
    data['description'] = this._description;
    data['post_type'] = this._postType;
    data['post_type_title'] = this._postTypeTitle;
    data['created_by'] = this._createdBy;
    data['created_by_title'] = this._createdByTitle;
    data['created_by_picture'] = this._createdByPicture;
    data['privacy'] = this._privacy;
    data['date'] = this._date;
    data['address'] = this._address;
    data['start_time'] = this._startTime;
    data['end_time'] = this._endTime;
    data['lat'] = this._lat;
    data['lng'] = this._lng;
    data['stream_type'] = this._streamType;
    data['likes'] = this._likes;
    data['praise'] = this._praise;
    data['amen'] = this._amen;
    data['hallelujah'] = this._hallelujah;
    data['parsed_time'] = this._parsedTime;
    data['parsed_date'] = this._parsedDate;
    data['parsed_month'] = this._parsedMonth;
    data['attachments'] = this._attachments;
    data['thumbnails'] = this._thumbnails;
    return data;
  }

  @override
  String toString() {
    return 'PostModel{_id: $_id, _title: $_title, _description: $_description, _postType: $_postType, _postTypeTitle: $_postTypeTitle, _createdBy: $_createdBy, _createdByTitle: $_createdByTitle, _createdByPicture: $_createdByPicture, _privacy: $_privacy, _date: $_date, _address: $_address, _startTime: $_startTime, _endTime: $_endTime, _lat: $_lat, _lng: $_lng, _streamType: $_streamType, _likes: $_likes, _praise: $_praise, _amen: $_amen, _hallelujah: $_hallelujah, _parsedTime: $_parsedTime, _parsedDate: $_parsedDate, _parsedMonth: $_parsedMonth, _attachments: $_attachments, _thumbnails: $_thumbnails}';
  }
}
