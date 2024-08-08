import 'dart:convert';

import 'package:flutter_task_xam/data/model/user_registration_response.dart';
import 'package:flutter_task_xam/domain/entity/user_registration_entity.dart';
import 'package:flutter_task_xam/domain/repository/user_registration_domain_repository.dart';
import 'package:logger/logger.dart';

import '../../app/services/api/api_endpoint.dart';
import '../../app/services/api/api_method.dart';
import '../../app/services/dio_service.dart';

class UserRepositoryImpl implements IUserRepository {
  DioHttpService httpService = DioHttpService();
  final logger = Logger();

  UserRepositoryImpl(this.httpService);

  @override
  Future<UserRegistrationResponse?> register(
      UserRegistrationEntity userRegistrationEntity) async {
    logger.i(json.encode(userRegistrationEntity.toJson()));
    //   try {
    //     var response = await httpService.request(
    //       url: APIEndpoint.UPLOAD_PHOTO,
    //       method: ApiMethod.POST,
    //       params: {
    //         "email": request.email,
    //         "firstName": request.firstName,
    //         "lastName": request.lastName,
    //         "mobileNumber": request.mobileNumber,
    //       },
    //     );

    //     if (response.statusCode == 200 || response.statusCode == 201) {
    //       return UserRegistrationResponse.fromJson(response.data);
    //     } else {
    //       logger.e('Error: Failed to register user');
    //       return null;
    //     }
    //   } catch (e) {
    //     logger.e('$e');
    //     return null;
    //   }
  }
}
