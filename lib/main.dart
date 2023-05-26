import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vesti_task/app/routes/route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Vesti',
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: true,
      initialRoute: RouteHelper.INITIAL_ROUTE,
      getPages: RouteHelper.routes,
    );
  }
}
