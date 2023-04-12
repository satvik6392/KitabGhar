import 'package:ecommerce_backend/models/models.dart';
import 'package:ecommerce_backend/services/database_service.dart';
import 'package:get/get.dart';

class OrderControlller extends GetxController{
 final DatabaseService database = DatabaseService();
 var orders = <Order>[].obs; 
 var pendingOrders = <Order>[].obs; 
 void onInit()
 {
  orders.bindStream(database.getOrders());
  pendingOrders.bindStream(database.getPendingOrders());
  super.onInit();
 }

 void updateOrder(Order order,String field,bool value)
 {
  database.updateOrder(order,field,value);
 }
}