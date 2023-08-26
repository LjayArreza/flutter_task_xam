// ignore_for_file: invalid_use_of_protected_member

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_task_xam/app/config/color_constants.dart';
import 'package:flutter_task_xam/presentation/controllers/upload_photo.controller.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddPhotoSectionWidget extends GetWidget<UploadPhotoController> {
  const AddPhotoSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Material(
          elevation: 8,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: controller.selectedPhotos.value.isEmpty
                ? MediaQuery.of(context).size.height * 0.2
                : MediaQuery.of(context).size.height * 0.25,
            color: AppColors.whiteColor,
            child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: const Text(
                      'Add Photos to side diary',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 20),
                    color: Colors.grey.shade200,
                    height: 1,
                  ),
                  controller.selectedPhotos.isNotEmpty
                      ? SizedBox(
                          height: 50,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: controller.selectedPhotos.value.length,
                            itemBuilder: (context, index) {
                              return Stack(
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    margin: const EdgeInsets.all(5),
                                    child: Image.file(
                                      File(controller.selectedPhotos[index]),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    top: 0,
                                    right: 0,
                                    child: GestureDetector(
                                      onTap: () {
                                        controller.removeSelectedPhoto(index);
                                      },
                                      child: Container(
                                        width: 15,
                                        height: 15,
                                        decoration: const BoxDecoration(
                                          color: Colors.black,
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Center(
                                          child: Icon(
                                            Icons.close,
                                            color: AppColors.whiteColor,
                                            size: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        )
                      : const SizedBox.shrink(),
                  const SizedBox(height: 10),
                  Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        var pickedImage = await ImagePicker().pickImage(
                          source: ImageSource.gallery,
                          imageQuality: 50,
                        );
                        if (pickedImage != null) {
                          String photoPath = pickedImage.path;
                          controller.addSelectedPhoto(photoPath);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.buttonColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: const Center(
                          child: Text(
                            'Add a photo',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 15),
                          child: const Text(
                            'Include photo gallery',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Checkbox(
                          value: controller.isCheckboxSelected.value,
                          activeColor: AppColors.buttonColor,
                          onChanged: (newValue) {
                            controller.setCheckbox(newValue!);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
