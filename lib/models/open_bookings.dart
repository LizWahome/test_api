// To parse this JSON data, do
//
//     final openBookings = openBookingsFromJson(jsonString);

import 'dart:convert';

class OpenBookings {
  OpenBookings({
    required this.id,
    required this.platNumber,
    required this.amount,
    required this.userId,
    this.orderId,
    required this.vehicleId,
    required this.locationId,
    this.transactionCode,
    this.topUpId,
    this.discountId,
    required this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? platNumber;
  int? amount;
  int? userId;
  int? orderId;
  int? vehicleId;
  int? locationId;

  String? transactionCode;
  dynamic topUpId;
  int? discountId;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory OpenBookings.fromJson(Map<String, dynamic> json) => OpenBookings(
        id: json["id"],
        platNumber: json["platNumber"],
        amount: json["amount"],
        userId: json["userId"],
        orderId: json["orderId"],
        vehicleId: json["vehicleId"],
        locationId: json["locationId"],
        transactionCode: json["transactionCode"],
        topUpId: json["topUpId"],
        discountId: json["discountId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "platNumber": platNumber,
        "amount": amount,
        "userId": userId,
        "orderId": orderId,
        "vehicleId": vehicleId,
        "locationId": locationId,
        "transactionCode": transactionCode,
        "topUpId": topUpId,
        "discountId": discountId,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
