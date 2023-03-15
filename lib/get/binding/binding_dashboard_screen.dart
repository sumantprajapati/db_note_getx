import 'package:db_note_getx/get/controller/controller_dashboard_screen.dart';
import 'package:get/get.dart';

class BindingDashboardScreen implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
  }

}