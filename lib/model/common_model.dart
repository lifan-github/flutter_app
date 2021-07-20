class CommonModel {
  String? title;
  String? icon;
  String? url;
  String? statusBarColor;
  bool? hideAppBar;

  CommonModel(
      {this.title, this.icon, this.url, this.statusBarColor, this.hideAppBar});

  factory CommonModel.fromJson(Map<String, dynamic> json) {
    return CommonModel(
      title: json['title'],
      icon: json['icon'],
      url: json['url'],
      statusBarColor: json['statusBarColor'],
      hideAppBar: json['hideAppBar'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['icon'] = this.icon;
    data['url'] = this.url;
    data['hideAppBar'] = this.hideAppBar;
    data['statusBarColor'] = this.statusBarColor;
    return data;
  }
}
