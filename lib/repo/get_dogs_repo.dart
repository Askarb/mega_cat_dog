import 'package:dio/dio.dart';
import 'package:dogs/models/dogs_model.dart';

import '../models/cats_model.dart';

class GetDogsRepo {
  String dogUrl = 'https://dog.ceo/api/breeds/image/random/';
  String catUrl = 'https://aws.random.cat/meow';
  final Dio dio;
  GetDogsRepo({required this.dio});

  Future<DogsModel> getDogsData({required int count}) async {
    final response = await dio.get("$dogUrl$count");
    return DogsModel.fromJson(response.data);
  }

  Future<CatsModel> getCatsData() async {
    final response = await dio.get(catUrl);
    print(response.data);
    return CatsModel.fromJson(response.data);
  }
}
