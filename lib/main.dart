import 'package:db_note_getx/get/get_routes.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:db_note_getx/screens/screen_dashboard.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  DashBoardScreen(),
      getPages: AppPages.pages,
    );
  }
}