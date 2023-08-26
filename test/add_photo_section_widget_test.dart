import 'package:flutter_task_xam/domain/repository/upload_photo_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_task_xam/presentation/controllers/upload_photo.controller.dart';

void main() {
  group('UploadPhotoController Tests', () {
    late UploadPhotoController controller;

    setUp(() {
      controller = UploadPhotoController(UploadPhotoRepository());
    });

    test('Initial values are set correctly', () {
      expect(controller.isLoading.value, false);
      expect(controller.isCheckboxSelected.value, false);
      expect(controller.isEventSelected.value, false);
      expect(controller.selectedPhotos, []);
      expect(controller.selectedDropdownValue.value, '');
      expect(controller.selectedDate.value, '');
    });

    test('Checkbox state can be set', () {
      controller.setCheckbox(true);
      expect(controller.isCheckboxSelected.value, true);
    });

    test('Event selection state can be set', () {
      controller.setEventSelect(true);
      expect(controller.isEventSelected.value, true);
    });

    test('Selected photo can be added', () {
      const photoPath = 'sample_photo.jpg';
      controller.addSelectedPhoto(photoPath);
      expect(controller.selectedPhotos, [photoPath]);
    });

    test('Selected photo can be removed', () {
      const photoPath = 'sample_photo.jpg';
      controller.addSelectedPhoto(photoPath);
      expect(controller.selectedPhotos, [photoPath]);

      controller.removeSelectedPhoto(0);
      expect(controller.selectedPhotos, []);
    });
  });
}
