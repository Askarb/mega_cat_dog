import 'package:dio/dio.dart';
import 'package:dogs/models/dogs_model.dart';

class GetDogsRepo {
  final Dio dio;
  GetDogsRepo({required this.dio});

  Future<DogsModel> getDogsData({required int count}) async {
    final response = await dio.get('$count');
    return DogsModel.fromJson(response.data);
  }
}
