import 'package:flutter_task_xam/app/core/base/base_controller.dart';
import 'package:get/get.dart';

class UploadPhotoController extends BaseController {
  var isCheckboxSelected = false.obs;
  var selectedPhotos = <String>[].obs;

  void setCheckbox(bool value) {
    isCheckboxSelected.value = value;
    value = !value;
  }

  void addSelectedPhoto(String photoPath) {
    selectedPhotos.add(photoPath);
  }

  void removeSelectedPhoto(int index) {
    if (index >= 0 && index < selectedPhotos.length) {
      selectedPhotos.removeAt(index);
    }
  }
}
