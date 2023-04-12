import 'dart:ffi';

import 'package:ecommerce_backend/services/database_service.dart';
import 'package:get/get.dart';

import '../models/models.dart';

class OrderStatsController extends GetxController{
  final DatabaseService database = DatabaseService();
  var stats = Future.value(<OrderStats>[]).obs;
  @override
  void onInit()
  {
    stats.value = database.getOrderStats();
    super.onInit();
  }
}