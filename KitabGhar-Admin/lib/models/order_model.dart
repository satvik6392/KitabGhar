// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Order extends Equatable {
  final int id;
  final int customerId;
  final List<int> productIds;
  final double deliveryFee;
  final double subtotal;
  final double total;
  final bool isAccepted;
  final bool isDelivered;
  final DateTime createdAt;
  final bool isCancelled;
  const Order({
    required this.id,
    required this.customerId,
    required this.productIds,
    required this.deliveryFee,
    required this.subtotal,
    required this.total,
    required this.isAccepted,
    required this.isDelivered,
    required this.createdAt,
    required this.isCancelled,
  });

  Order copyWith({
    int? id,
    int? customerId,
    List<int>? productIds,
    double? deliveryFee,
    double? subtotal,
    double? total,
    bool? isAccepted,
    bool? isDelivered,
    DateTime? createdAt,
    bool? isCancelled,
  }) {
    return Order(
      id: id ?? this.id,
      customerId: customerId ?? this.customerId,
      productIds: productIds ?? this.productIds,
      deliveryFee: deliveryFee ?? this.deliveryFee,
      subtotal: subtotal ?? this.subtotal,
      total: total ?? this.total,
      isAccepted: isAccepted ?? this.isAccepted,
      isDelivered: isDelivered ?? this.isDelivered,
      createdAt: createdAt ?? this.createdAt,
      isCancelled: isCancelled ?? this.isCancelled,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'customerId': customerId,
      'productIds': productIds,
      'deliveryFee': deliveryFee,
      'subtotal': subtotal,
      'total': total,
      'isAccepted': isAccepted,
      'isCancelled': isCancelled,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory Order.fromSnapshot(DocumentSnapshot snap) {
    return Order(
      id: snap['id'],
      customerId: snap['customerId'],
      productIds: List<int>.from(snap['productIds']),
      deliveryFee: snap['deliveryFee'],
      subtotal: snap['subtotal'],
      total: snap['total'],
      isAccepted: snap['isAccepted'],
      isDelivered: snap['isDelivered'],
      isCancelled: snap['isCancelled'],
      createdAt: snap['createdAt'].toDate(),
    );
  }

  String toJson() => json.encode(toMap());
  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      customerId,
      productIds,
      deliveryFee,
      subtotal,
      total,
      isAccepted,
      isDelivered,
      createdAt,
      isCancelled,
    ];
  }
  static List<Order> orders = [
    Order(isCancelled: false, id: 1, customerId: 123, productIds: const [35,2], deliveryFee: 10, subtotal: 100, total: 100 , isAccepted: false, isDelivered: false, createdAt: DateTime.now()),
    Order(isCancelled: false,id: 3, customerId: 53, productIds: const [2,6], deliveryFee: 10, subtotal: 100, total: 100 , isAccepted: false, isDelivered: false, createdAt: DateTime.now()),
    Order(isCancelled: false,id: 2, customerId: 13, productIds: const [9,2], deliveryFee: 10, subtotal: 100, total: 100 , isAccepted: true, isDelivered: false, createdAt: DateTime.now()),
  ];
}
