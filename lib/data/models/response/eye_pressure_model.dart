class EyePressureModel {
  int? id;
  String? userId;
  String? date;
  String? reading;

  EyePressureModel({
    this.id,
    this.userId,
    this.date,
    this.reading,
  });

  EyePressureModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    date = json['date'];
    reading = json['reading'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['date'] = date;
    data['reading'] = reading;
    return data;
  }
}
