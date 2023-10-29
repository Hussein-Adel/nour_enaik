class EyeSightModel {
  int? id;
  String? userId;
  String? date;
  String? notes;

  EyeSightModel({
    this.id,
    this.userId,
    this.date,
    this.notes,
  });

  EyeSightModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    date = json['date'];
    notes = json['notes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['date'] = date;
    data['notes'] = notes;
    return data;
  }
}
