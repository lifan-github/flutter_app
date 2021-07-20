class SalesBoxtModel {
  String? icon;
  String? moreUrl;
  BigCard1? bigCard1;
  BigCard1? bigCard2;
  BigCard1? smallCard1;
  BigCard1? smallCard2;
  BigCard1? smallCard3;
  BigCard1? smallCard4;

  SalesBoxtModel(
      {this.icon,
      this.moreUrl,
      this.bigCard1,
      this.bigCard2,
      this.smallCard1,
      this.smallCard2,
      this.smallCard3,
      this.smallCard4});

  SalesBoxtModel.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    moreUrl = json['moreUrl'];
    bigCard1 = json['bigCard1'] != null
        ? new BigCard1.fromJson(json['bigCard1'])
        : null;
    bigCard2 = json['bigCard2'] != null
        ? new BigCard1.fromJson(json['bigCard2'])
        : null;
    smallCard1 = json['smallCard1'] != null
        ? new BigCard1.fromJson(json['smallCard1'])
        : null;
    smallCard2 = json['smallCard2'] != null
        ? new BigCard1.fromJson(json['smallCard2'])
        : null;
    smallCard3 = json['smallCard3'] != null
        ? new BigCard1.fromJson(json['smallCard3'])
        : null;
    smallCard4 = json['smallCard4'] != null
        ? new BigCard1.fromJson(json['smallCard4'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = this.icon;
    data['moreUrl'] = this.moreUrl;
    if (this.bigCard1 != null) {
      data['bigCard1'] = this.bigCard1!.toJson();
    }
    if (this.bigCard2 != null) {
      data['bigCard2'] = this.bigCard2!.toJson();
    }
    if (this.smallCard1 != null) {
      data['smallCard1'] = this.smallCard1!.toJson();
    }
    if (this.smallCard2 != null) {
      data['smallCard2'] = this.smallCard2!.toJson();
    }
    if (this.smallCard3 != null) {
      data['smallCard3'] = this.smallCard3!.toJson();
    }
    if (this.smallCard4 != null) {
      data['smallCard4'] = this.smallCard4!.toJson();
    }
    return data;
  }
}

class BigCard1 {
  String? icon;
  String? url;
  String? title;

  BigCard1({this.icon, this.url, this.title});

  BigCard1.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    url = json['url'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = this.icon;
    data['url'] = this.url;
    data['title'] = this.title;
    return data;
  }
}
