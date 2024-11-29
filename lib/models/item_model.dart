import 'package:flutter/material.dart';

class ItemModel {
  String? id;
  String? itemName;
  String? itemCategory;
  int? itemQuantity;
  String? itemDescription;
  List<dynamic>? itemImageUrls;
  DateTime? selectedDate;
  TimeOfDay? startTime;
  TimeOfDay? endTime;
  String? pickupInstruction;
  String? organizationName;
  String? address;
  String? locationImageUrl;
  String? createdBy;
  bool? isApproved;

  ItemModel(
      {this.id,
      this.itemName,
      this.itemCategory,
      this.itemQuantity,
      this.itemDescription,
      this.itemImageUrls,
      this.selectedDate,
      this.startTime,
      this.endTime,
      this.pickupInstruction,
      this.organizationName,
      this.address,
      this.locationImageUrl,
      this.createdBy,
      this.isApproved});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'itemName': itemName,
      'itemCategory': itemCategory,
      'itemQuantity': itemQuantity,
      'itemDescription': itemDescription,
      'itemImageUrls': itemImageUrls,
      'selectedDate': selectedDate?.toIso8601String(),
      'startTime': startTime?.hour,
      'endTime': endTime?.hour,
      'pickupInstruction': pickupInstruction,
      'organizationName': organizationName,
      'address': address,
      'locationImageUrl': locationImageUrl,
      'createdBy': createdBy,
      'isApproved': isApproved,
    };
  }

  static ItemModel fromMap(Map<String, dynamic> map) {
    return ItemModel(
      id: map['id'] ?? '',
      itemName: map['itemName'] ?? '',
      itemCategory: map['itemCategory'] ?? '',
      itemQuantity: map['itemQuantity'] ?? 0,
      itemDescription: map['itemDescription'] ?? '',
      itemImageUrls: List<String>.from(map['itemImageUrls'] ?? []),
      selectedDate: map['selectedDate'] != null
          ? DateTime.parse(map['selectedDate'])
          : DateTime.now(),
      startTime: map['startTime'] != null
          ? TimeOfDay(hour: map['startTime'], minute: 0) // Corrected here
          : TimeOfDay.now(),
      endTime: map['endTime'] != null
          ? TimeOfDay(hour: map['endTime'], minute: 0) // Corrected here
          : TimeOfDay.now(),
      pickupInstruction: map['pickupInstruction'] ?? '',
      organizationName: map['organizationName'] ?? '',
      address: map['address'] ?? '',
      locationImageUrl: map['locationImageUrl'] ?? '',
      createdBy: map['createdBy'] ?? '',
      isApproved: map['isApproved'] ?? false,
    );
  }
}
