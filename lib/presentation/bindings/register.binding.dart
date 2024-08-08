import 'package:flutter_task_xam/domain/repository/user_repository.dart';
import 'package:get/get.dart';

import '../controllers/user.controller.dart';

class RegisterBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<UserController>(
            () => UserController(UserRepository()));
  }

}