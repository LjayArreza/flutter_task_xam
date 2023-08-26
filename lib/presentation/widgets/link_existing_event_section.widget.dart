import 'package:flutter/material.dart';
import 'package:flutter_task_xam/app/config/color_constants.dart';
import 'package:flutter_task_xam/presentation/controllers/upload_photo.controller.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';

class LinkExistingEventSectionWidget extends GetWidget<UploadPhotoController> {
  const LinkExistingEventSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Material(
          elevation: 8,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.2,
            color: AppColors.whiteColor,
            child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 15),
                          child: const Text(
                            'Link to existing event?',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Checkbox(
                          value: controller.isEventSelected.value,
                          activeColor: AppColors.buttonColor,
                          onChanged: (newValue) {
                            controller.setEventSelect(newValue!);
                          },
                        ),
                      ],
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
                    width: MediaQuery.of(context).size.width,
                    child: TypeAheadField<String>(
                      textFieldConfiguration: TextFieldConfiguration(
                        controller: controller.selectEventController,
                        style: const TextStyle(fontSize: 12),
                        decoration: const InputDecoration(
                          hintText: 'Select an event',
                          hintStyle: TextStyle(fontSize: 12),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.blackColor),
                          ),
                          suffixIcon: Icon(
                            Icons.arrow_drop_down,
                            color: AppColors.grayColor,
                          ),
                        ),
                      ),
                      suggestionsCallback: (pattern) async {
                        return controller.selectEventsItems;
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
                        controller.selectEventController.text = suggestion;
                      },
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
