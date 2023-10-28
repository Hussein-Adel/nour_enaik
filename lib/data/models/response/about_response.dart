class AboutAppModel {
  int? id;
  String? desc;

  AboutAppModel({
    this.id,
    this.desc,
  });

  AboutAppModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['desc'] = desc;

    return data;
  }
}
