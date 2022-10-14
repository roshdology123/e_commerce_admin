import 'package:e_commerce_admin/models/models.dart';
import 'package:e_commerce_admin/services/database_service.dart';
import 'package:get/get.dart';

class OrderStatsController extends GetxController {
  final DatabaseService databaseService = DatabaseService();

  var stats = Future.value(<OrderStats>[]).obs;

  @override
  void onInit() {
    stats.value = databaseService.getOrderStats();
    super.onInit();
  }
}
