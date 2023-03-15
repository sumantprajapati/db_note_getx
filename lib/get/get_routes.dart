import 'package:get/get.dart';
import 'package:db_note_getx/get/screens.dart';
import 'package:db_note_getx/get/bindings.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: DashBoardScreen.pageId,
      page: () => DashBoardScreen(),
      binding: BindingDashboardScreen(),
    ),
  ];
}
