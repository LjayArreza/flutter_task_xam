import 'package:flutter_task_xam/app/core/base/base_binding.dart';
import 'package:flutter_task_xam/presentation/controllers/upload_photo.controller.dart';
import 'package:get/get.dart';

class UploadPhotoBinding implements BaseBinding {
  @override
  void dependencies() {
    Get.lazyPut<UploadPhotoController>(() => UploadPhotoController());
  }
}
