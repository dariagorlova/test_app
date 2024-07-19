import 'dart:async';

import 'package:test_app/features/home/index.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeApiService _apiService;

  const HomeRepositoryImpl(this._apiService);

  @override
  FutureOr<List<HomeData>?> fetchData() => _apiService.fetchData();
}
