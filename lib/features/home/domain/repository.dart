import 'dart:async';

import 'package:test_app/features/home/index.dart';

abstract class HomeRepository {
  FutureOr<List<HomeData>?> fetchData();
}
