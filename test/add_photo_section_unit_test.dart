import 'package:flutter_task_xam/domain/repository/upload_photo_repository.dart';
import 'package:flutter_task_xam/presentation/controllers/upload_photo.controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UploadPhotoController Unit Tests', () {
    late UploadPhotoController controller;

    setUp(() {
      controller = UploadPhotoController(UploadPhotoRepository());
    });

    test('Checkbox state can be set', () {
      controller.setCheckbox(true);
      expect(controller.isCheckboxSelected.value, true);

      controller.setCheckbox(false);
      expect(controller.isCheckboxSelected.value, false);
    });

    test('Event selection state can be set', () {
      controller.setEventSelect(true);
      expect(controller.isEventSelected.value, true);

      controller.setEventSelect(false);
      expect(controller.isEventSelected.value, false);
    });

    test('Selected photo can be added and removed', () {
      const photoPath = 'sample_photo.jpg';

      // Add a photo
      controller.addSelectedPhoto(photoPath);
      expect(controller.selectedPhotos, [photoPath]);

      // Remove the photo
      controller.removeSelectedPhoto(0);
      expect(controller.selectedPhotos, []);
    });
  });
}
