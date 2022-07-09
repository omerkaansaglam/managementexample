import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class UserModel {
  String email;
  String id;
  num job;
  String name;
  String password;
  String phone;
  String profileImage;
  String siteId;
  UserModel({
    required this.email,
    required this.id,
    required this.job,
    required this.name,
    required this.password,
    required this.phone,
    required this.profileImage,
    required this.siteId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return _$UserModelFromJson(json);
  }

  Map<String, Object?> toJson() => _$UserModelToJson(this);
}

@Collection<UserModel>('Users')
final usersRef = UserModelCollectionReference();


