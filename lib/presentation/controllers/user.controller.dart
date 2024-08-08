import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_task_xam/app/core/base/base_controller.dart';
import 'package:flutter_task_xam/data/model/upload_photo_response.dart';
import 'package:flutter_task_xam/data/model/user_registration_response.dart';
import 'package:flutter_task_xam/domain/entity/user_registration_entity.dart';
import 'package:flutter_task_xam/domain/repository/upload_photo_repository.dart';
import 'package:flutter_task_xam/data/repository/user_data_repository.dart';
import 'package:flutter_task_xam/domain/usecase/register_user_usecase.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

class UserController extends BaseController {
  final RegisterUserUseCase registerUserUseCase;
  UserController(this.registerUserUseCase);

  var emailController = TextEditingController();
  var mobileController = TextEditingController();
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  final logger = Logger();

  @override
  void onClose() {
    emailController.dispose();
    mobileController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    super.onClose();
  }

  // If this is a real api, this is where we set the images and all details needed to pass in the repositories param.
  Future<void> registerUser() async {
    UserRegistrationEntity userRegistrationRequest = UserRegistrationEntity();
    populateUserRegistrationRequest(userRegistrationRequest);
    UserRegistrationResponse? response =
        await registerUserUseCase(userRegistrationRequest);

    // kung napansin mo, sa usecase na tayo kumukuha ng data. kasi ang usecase ang sumasalo sa mga data na galing sa repository. So every usecase iba ibang function dapat.
    if (response != null) {
      print('ITO ANG RESPONSE: ${json.encode(response)}');
      // Pwede ka mag print dito ng mga gusto mo makita from response. And dito mo eh lagay ang event na gusto mo after mag success, like proceed to other screens.
      // success
    } else {
      // failed
    }
  }

  void populateUserRegistrationRequest(
      UserRegistrationEntity userRegistrationRequest) {
    userRegistrationRequest.email = emailController.text;
    userRegistrationRequest.firstName = firstNameController.text;
    userRegistrationRequest.lastName = lastNameController.text;
    userRegistrationRequest.mobileNumber = mobileController.text;
  }
}
