import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_tomato_leaf_disease/utils/base_url_util.dart';

class ApiService {
  static final Dio _dio = Dio();

  static Future<Map<String, dynamic>> predictDisease(File imageFile) async {
    try {
      String apiUrl = BaseUrl.baseUrl;

      FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(imageFile.path,
            filename: 'image.jpg'),
      });

      Response response = await _dio.post(
        apiUrl,
        data: formData,
        options: Options(contentType: 'multipart/form-data'),
      );

      return response.data;
    } catch (e) {
      throw Exception('Gagal melakukan prediksi: ${e.toString()}');
    }
  }
}