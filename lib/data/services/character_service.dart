import 'package:dio/dio.dart';

import '../../constants/strings.dart';

class CharacterService {
  late Dio dio;

  CharacterService() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000,
      receiveTimeout: 20 * 1000,
    );

    dio = Dio(options);
  }

  Future<List<Map<String, dynamic>>> get allCharacters async {
    try {
      Response response = await dio.get(charactersPath);
      print(response.data.toString());
      return response.data;
    } catch (exception) {
      print(exception);
      return [];
    }
  }
}
