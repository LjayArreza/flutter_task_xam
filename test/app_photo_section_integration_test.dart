import 'package:flutter/material.dart';
import 'package:flutter_task_xam/domain/repository/upload_photo_repository.dart';
import 'package:flutter_task_xam/presentation/widgets/add_photo_section.widget.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_task_xam/presentation/controllers/upload_photo.controller.dart';
import 'package:get/get.dart';

void main() {
  group('Integration Tests', () {
    late UploadPhotoController controller;

    setUp(() {
      controller = UploadPhotoController(UploadPhotoRepository());
      Get.put<UploadPhotoController>(
          controller); // Register the controller with GetX
    });

    tearDown(() {
      Get.reset(); // Reset GetX bindings after each test
    });

    testWidgets('AddPhotoSectionWidget displays correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const GetMaterialApp(
          home: AddPhotoSectionWidget(),
        ),
      );

      // Expect to find specific widgets within the widget tree
      expect(find.text('Add Photos to side diary'), findsOneWidget);
      expect(find.text('Add a photo'), findsOneWidget);
      expect(find.byType(Checkbox), findsOneWidget);
    });

    testWidgets('Add a selected photo and remove it',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const GetMaterialApp(
          home: AddPhotoSectionWidget(),
        ),
      );

      // Add a selected photo
      const photoPath = 'sample_photo.jpg';
      controller.addSelectedPhoto(photoPath);
      await tester.pumpAndSettle(); // Wait for the UI to update

      // Expect to find the added photo
      expect(find.byType(Image), findsOneWidget);

      // Remove the selected photo
      controller.removeSelectedPhoto(0);
      await tester.pumpAndSettle(); // Wait for the UI to update

      // Expect the photo to be removed
      expect(find.byType(Image), findsNothing);
    });
  });
}
