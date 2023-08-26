import 'package:flutter_task_xam/app/services/api/api_endpoint.dart';
import 'package:flutter_task_xam/app/services/api/api_method.dart';
import 'package:flutter_task_xam/app/services/dio_service.dart';
import 'package:flutter_task_xam/data/model/upload_photo_response.dart';
import 'package:logger/logger.dart';

class UploadPhotoRepository {
  DioHttpService httpService = DioHttpService();
  final logger = Logger();
  UploadPhotoRepository();

// If this is a real project, this is where we call the endpoint to upload the photo that is selected from the UI.
  Future<dynamic> setUploadPhoto({
    String? name,
    String? job,
  }) async {
    httpService.init();
    try {
      var response = await httpService.request(
        url: APIEndpoint.UPLOAD_PHOTO,
        method: ApiMethod.POST,
        params: {
          "name": name,
          "job": job,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return UploadPhotoResponse.fromJson(response.data);
      } else {
        print('Error: Failed to load api');
      }
    } catch (e) {
      print('$e');
    }
  }
}
