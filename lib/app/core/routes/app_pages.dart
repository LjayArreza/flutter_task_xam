import 'package:flutter_task_xam/presentation/bindings/upload_photo.binding.dart';
import 'package:flutter_task_xam/presentation/views/upload_photo.view.dart';
import 'package:get/route_manager.dart';

part 'routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.UPLOAD_PHOTO,
      page: () => const UploadPhotoView(),
      binding: UploadPhotoBinding(),
    ),
  ];
}
