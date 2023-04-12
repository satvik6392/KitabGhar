import 'package:ecommerce_backend/controllers/order_stats_controller.dart';
import 'package:ecommerce_backend/models/order_stats_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'screens.dart';
import 'package:intl/intl.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final OrderStatsController orderStatsController =
      Get.put(OrderStatsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Store'),
        backgroundColor: Colors.black,
      ),
      body: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FutureBuilder(builder: (BuildContext context, AsyncSnapshot<List<OrderStats>> snapshot) {
              if(snapshot.hasData)
              {
                return Container(
                height: 250,
                padding: const EdgeInsets.all(10),
                child: CustomBarChart(orderStats: snapshot.data!));
              }else if(snapshot.hasError)
              {
                return Text('${snapshot.error}');
              }
              return Center(child: CircularProgressIndicator(color: Colors.black,),);
            }, future: orderStatsController.stats.value,),

            
            Container(
              width: double.infinity,
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                  onTap: () {
                    Get.to(() => ProductScreen());
                  },
                  child: const Card(
                    child: Center(child: Text('Go to Products')),
                  )),
            ),
            Container(
              width: double.infinity,
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                  onTap: () {
                    Get.to(() => OrdersScreen());
                  },
                  child: const Card(
                    child: Center(child: Text('Go to Orders')),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class CustomBarChart extends StatelessWidget {
  final List<OrderStats> orderStats;
  const CustomBarChart({super.key, required this.orderStats});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<OrderStats, String>> series = [
      charts.Series(
        id: 'orders',
        data: orderStats,
        domainFn: (series, _) => DateFormat.d().format(series.dateTime).toString() ,
        measureFn: (series, _) => series.orders,
        colorFn: (series, _) => series.barColor!,
      )
    ];
    return charts.BarChart(
      series,
      animate: true,
    );
  }
}
