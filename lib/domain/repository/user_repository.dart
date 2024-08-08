import 'package:flutter_task_xam/data/request/user_registration_request.dart';
import 'package:logger/logger.dart';

import '../../app/services/api/api_endpoint.dart';
import '../../app/services/api/api_method.dart';
import '../../app/services/dio_service.dart';

class UserRepository{
  DioHttpService httpService = DioHttpService();
  final logger = Logger();

  UserRepository();

  // If this is a real project, this is where we call the endpoint to upload the photo that is selected from the UI.
  Future<dynamic> register(UserRegistrationRequest userRegistrationRequest) async {
    logger.i(userRegistrationRequest.email);
    // httpService.init();
    // try {
    //   var response = await httpService.request(
    //     url: APIEndpoint.UPLOAD_PHOTO,
    //     method: ApiMethod.POST,
    //     params: {
    //       "email": userRegistrationRequest.email,
    //       "firstName": userRegistrationRequest.firstName,
    //       "lastName": userRegistrationRequest.lastName,
    //       "mobileNumber": userRegistrationRequest.mobileNumber,
    //     },
    //   );
    //   if (response.statusCode == 200 || response.statusCode == 201) {
    //     return "TEST";
    //   } else {
    //     print('Error: Failed to load api');
    //   }
    // } catch (e) {
    //   print('$e');
    // }
  }

}