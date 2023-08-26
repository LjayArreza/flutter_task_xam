import 'package:flutter/material.dart';
import 'package:flutter_task_xam/app/config/color_constants.dart';
import 'package:flutter_task_xam/presentation/controllers/upload_photo.controller.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';

class DetailsSectionWidget extends GetWidget<UploadPhotoController> {
  const DetailsSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Material(
        elevation: 8,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.35,
          color: AppColors.whiteColor,
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text(
                    'Details',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 10),
                  color: Colors.grey.shade200,
                  height: 1,
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                    bottom: 10,
                  ),
                  child: TextFormField(
                    onTap: () {
                      controller.selectDate(context);
                    },
                    controller: controller.detailsDateController,
                    style: const TextStyle(fontSize: 12),
                    decoration: const InputDecoration(
                      hintText: 'Select date',
                      hintStyle: TextStyle(fontSize: 12),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.grayColor),
                      ),
                      suffixIcon: Icon(
                        Icons.arrow_drop_down,
                        color: AppColors.darkGrayColor,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                    bottom: 10,
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: TypeAheadField<String>(
                    textFieldConfiguration: TextFieldConfiguration(
                      controller: controller.detailsAreaController,
                      style: const TextStyle(fontSize: 12),
                      decoration: const InputDecoration(
                        hintText: 'Select area',
                        hintStyle: TextStyle(fontSize: 12),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.blackColor),
                        ),
                        suffixIcon: Icon(
                          Icons.arrow_drop_down,
                          color: AppColors.darkGrayColor,
                        ),
                      ),
                    ),
                    suggestionsCallback: (pattern) async {
                      return controller.selectAreaItems;
                    },
                    itemBuilder: (context, suggestion) {
                      return ListTile(
                        title: Text(
                          suggestion,
                          style: const TextStyle(fontSize: 12),
                        ),
                      );
                    },
                    onSuggestionSelected: (String suggestion) {
                      controller.detailsAreaController.text = suggestion;
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                    bottom: 10,
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: TypeAheadField<String>(
                    textFieldConfiguration: TextFieldConfiguration(
                      controller: controller.taskCategoryController,
                      style: const TextStyle(fontSize: 12),
                      decoration: const InputDecoration(
                        hintText: 'Task category',
                        hintStyle: TextStyle(fontSize: 12),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.blackColor),
                        ),
                        suffixIcon: Icon(
                          Icons.arrow_drop_down,
                          color: AppColors.darkGrayColor,
                        ),
                      ),
                    ),
                    suggestionsCallback: (pattern) async {
                      return controller.selectTaskCategoryItems;
                    },
                    itemBuilder: (context, suggestion) {
                      return ListTile(
                        title: Text(
                          suggestion,
                          style: const TextStyle(fontSize: 12),
                        ),
                      );
                    },
                    onSuggestionSelected: (String suggestion) {
                      controller.taskCategoryController.text = suggestion;
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                    bottom: 10,
                  ),
                  child: TextFormField(
                    controller: controller.tagsController,
                    style: const TextStyle(fontSize: 12),
                    decoration: const InputDecoration(
                      hintText: 'Tags',
                      hintStyle: TextStyle(fontSize: 12),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.grayColor),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
