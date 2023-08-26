import 'package:flutter/material.dart';
import 'package:flutter_task_xam/app/core/base/base_controller.dart';
import 'package:flutter_task_xam/data/model/upload_photo_response.dart';
import 'package:flutter_task_xam/domain/repository/upload_photo_repository.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class UploadPhotoController extends BaseController {
  UploadPhotoRepository uploadPhotoRepo;
  UploadPhotoController(this.uploadPhotoRepo);
  var commentsController = TextEditingController();
  var detailsDateController = TextEditingController();
  var detailsAreaController = TextEditingController();
  var taskCategoryController = TextEditingController();
  var tagsController = TextEditingController();
  var selectEventController = TextEditingController();

  var isLoading = false.obs;

  var isCheckboxSelected = false.obs;
  var isEventSelected = false.obs;

  var selectedPhotos = <String>[].obs;

  List<String> selectAreaItems = ['Area 1', 'Area 2', 'Area 3', 'Area 4'];

  List<String> selectTaskCategoryItems = [
    'Category 1',
    'Category 2',
    'Category 3',
    'Category 4'
  ];
  List<String> selectEventsItems = ['Event 1', 'Event 2', 'Event 3', 'Event 4'];

  RxString selectedDropdownValue = RxString('');

  var selectedDate = ''.obs;

  void setSelectedDropdownValue(String value) {
    selectedDropdownValue.value = value;
  }

  void setCheckbox(bool value) {
    isCheckboxSelected.value = value;
    value = !value;
  }

  void setEventSelect(bool value) {
    isEventSelected.value = value;
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

  Future<void> selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.blue,
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary),
            colorScheme: const ColorScheme.light(primary: Colors.blue)
                .copyWith(secondary: Colors.blue),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      selectedDate.value = DateFormat('MM/dd/yyyy').format(picked);
      detailsDateController.text = selectedDate.value;
    }
  }

// If this is a real api, this is where we set the images and all details needed to pass in the repositories param.
  Future<void> uploadPhoto() async {
    isLoading(true);
    var response =
        await uploadPhotoRepo.setUploadPhoto(name: 'morpheus', job: 'leader');
    if (response is UploadPhotoResponse) {
      isLoading(false);
      Fluttertoast.showToast(
        msg: 'Upload photo successfully!',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
      );
    } else {
      isLoading(false);
      Fluttertoast.showToast(
        msg: 'Failed to upload photo!',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
      );
    }
  }
}
