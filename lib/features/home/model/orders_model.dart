import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:json_annotation/json_annotation.dart';

part 'orders_model.g.dart';

@JsonSerializable()
class OrdersModel {
  String dateTime;
  num job;
  String name;
  String number;
  String staff;
  OrdersModel({
    required this.dateTime,
    required this.job,
    required this.name,
    required this.number,
    required this.staff,
  });


  factory OrdersModel.fromJson(Map<String, dynamic> json) {
    return _$OrdersModelFromJson(json);
  }

  Map<String, Object?> toJson() => _$OrdersModelToJson(this);
}

@Collection<OrdersModel>('site')
final usersRef = OrdersModelCollectionReference();


