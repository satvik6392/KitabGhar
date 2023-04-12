import 'package:ecommerce_backend/models/models.dart' as models;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_backend/models/order_stats_model.dart';

class DatabaseService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<List<OrderStats>> getOrderStats() {
    return _firebaseFirestore
        .collection('order_stats')
        .orderBy('dateTime')
        .get()
        .then((querySnapshot) => querySnapshot.docs
            .asMap()
            .entries
            .map((entry) => OrderStats.fromSnapshot(entry.value, entry.key))
            .toList());
  }

  Stream<List<models.Product>> getProducts() {
    return _firebaseFirestore.collection('products').snapshots().map(
        (snapshot) => snapshot.docs
            .map((doc) => models.Product.fromSnapshot(doc))
            .toList());
  }

  Stream<List<models.Order>> getPendingOrders() {
    return _firebaseFirestore
        .collection('orders')
        .where('isDelivered', isEqualTo: false)
        .where('isCancelled', isEqualTo: false)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => models.Order.fromSnapshot(doc))
            .toList());
  }

  Stream<List<models.Order>> getOrders() {
    return _firebaseFirestore.collection('orders').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => models.Order.fromSnapshot(doc)).toList());
  }

  Future<void> addProduct(models.Product product) {
    return _firebaseFirestore.collection('products').add(product.toMap());
  }

  Future<void> updateField(
      models.Product product, String field, dynamic newValue) {
    return _firebaseFirestore
        .collection('products')
        .where('id', isEqualTo: product.id)
        .get()
        .then((querySnapshot) =>
            querySnapshot.docs.first.reference.update({field: newValue}));
  }

  Future<void> updateOrder(models.Order order, String field, bool value) {
    return _firebaseFirestore
        .collection('orders')
        .where('id', isEqualTo: order.id)
        .get()
        .then((querySnapshot) =>
            querySnapshot.docs.first.reference.update({field: value}));
  }
}
