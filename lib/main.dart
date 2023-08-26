import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_task_xam/app/core/routes/app_pages.dart';
import 'package:get/get.dart';

import 'app/services/environment.dart';

Future<void> main() async {
  await dotenv.load(fileName: Environment.mode);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Martin Pulgar Construction',
      theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
      defaultTransition: Transition.fade,
      initialRoute: Routes.UPLOAD_PHOTO,
      getPages: AppPages.pages,
    );
  }
}
