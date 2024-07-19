import 'dart:async';

import 'package:dio/dio.dart';
import 'package:test_app/core/api_key.dart';
import 'package:test_app/core/index.dart';
import 'package:test_app/features/home/index.dart';

abstract class HomeApiService {
  FutureOr<List<HomeData>?> fetchData();
}

class HomeApiServiceImpl implements HomeApiService {
  @override
  FutureOr<List<HomeData>?> fetchData() async {
    try {
      final response = await Dio().get(
        pexelsUrl,
        options: Options(headers: {"Authorization": apiKey}),
      );

      if (response.statusCode == 200) {
        return (response.data['photos'] as List)
            .map((i) => HomeData.fromJson(i))
            .toList();
      }
      return null;
    } catch (error) {
      return null;
    }
  }
}
