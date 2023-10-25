// class UserResponse {
//   bool? success;
//   UserData? data;
//   String? message;
//
//   UserResponse({this.success, this.data, this.message});
//
//   UserResponse.fromJson(Map<String, dynamic> json) {
//     success = json['success'];
//     data = json['data'] != null ? new UserData.fromJson(json['data']) : null;
//     message = json['message'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['success'] = this.success;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     data['message'] = this.message;
//     return data;
//   }
//
//   String convertUserToSharedPreferencesObject() => jsonEncode(this);
//   factory UserResponse.fromSharedPreferencesObject(String? prefObject) {
//     if (prefObject != null) {
//       return UserResponse.fromJson(jsonDecode(prefObject));
//     }
//     return UserResponse();
//   }
// }

import 'dart:convert';

class UserData {
  String? token;
  User? user;

  UserData({this.token, this.user});

  UserData.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }

  String convertUserToSharedPreferencesObject() => jsonEncode(this);
  factory UserData.fromSharedPreferencesObject(String? prefObject) {
    if (prefObject != null) {
      return UserData.fromJson(jsonDecode(prefObject));
    }
    return UserData();
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? phone;
  bool? receiveNotifications;
  String? walletBalance;
  String? affiliateCurrentBalance;
  String? affiliateCode;
  String? otp;
  Rank? rank;

  User(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.receiveNotifications,
      this.walletBalance,
      this.affiliateCurrentBalance,
      this.affiliateCode,
      this.otp,
      this.rank});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    receiveNotifications = json['receive_notifications'];
    walletBalance = json['wallet_balance'].toString();
    affiliateCurrentBalance = json['affiliate_current_balance'].toString();
    affiliateCode = json['affiliate_code'];
    otp = json['otp'];
    rank = json['rank'] != null ? new Rank.fromJson(json['rank']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['receive_notifications'] = this.receiveNotifications;
    data['wallet_balance'] = this.walletBalance;
    data['affiliate_current_balance'] = this.affiliateCurrentBalance;
    data['affiliate_code'] = this.affiliateCode;
    data['otp'] = this.otp;
    if (this.rank != null) {
      data['rank'] = this.rank!.toJson();
    }
    return data;
  }
}

class Rank {
  int? id;
  String? image;
  String? name;
  int? completedOrdersCount;
  int? commission;
  int? isDefault;

  Rank(
      {this.id,
      this.image,
      this.name,
      this.completedOrdersCount,
      this.commission,
      this.isDefault});

  Rank.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
    completedOrdersCount = json['completed_orders_count'];
    commission = json['commission'];
    isDefault = json['is_default'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['name'] = this.name;
    data['completed_orders_count'] = this.completedOrdersCount;
    data['commission'] = this.commission;
    data['is_default'] = this.isDefault;
    return data;
  }
}
