import 'package:flutter/material.dart';
import 'package:flutter_task_xam/app/core/base/base_controller.dart';
import 'package:flutter_task_xam/data/model/upload_photo_response.dart';
import 'package:flutter_task_xam/data/request/user_registration_request.dart';
import 'package:flutter_task_xam/domain/repository/upload_photo_repository.dart';
import 'package:flutter_task_xam/domain/repository/user_repository.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

class UserController extends BaseController {
  UserRepository userRepository;
  UserController(this.userRepository);
  var emailController =  TextEditingController();
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
  UserRegistrationRequest userRegistrationRequest = UserRegistrationRequest();
    populateUserRegistrationRequest(userRegistrationRequest);
  userRepository.register(userRegistrationRequest);


  }

  void populateUserRegistrationRequest(UserRegistrationRequest userRegistrationRequest){
    userRegistrationRequest.email = emailController.text;
    userRegistrationRequest.firstName = firstNameController.text;
    userRegistrationRequest.lastName = lastNameController.text;
    userRegistrationRequest.mobileNumber = mobileController.text;
  }
}
