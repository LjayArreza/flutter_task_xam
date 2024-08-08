import 'package:flutter_task_xam/app/services/dio_service.dart';
import 'package:flutter_task_xam/data/repository/user_data_repository.dart';
import 'package:flutter_task_xam/domain/usecase/register_user_usecase.dart';
import 'package:get/get.dart';

import '../controllers/user.controller.dart';

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserController>(() => UserController(
        RegisterUserUseCase(UserRepositoryImpl(DioHttpService()))));
  }
}


// meron akong changes sa dependency injection. Need natin eh sama ang usecase dito.
