import 'package:flutter/foundation.dart';
import 'package:ny_times_app/app/constants/app_constant.dart';
import 'package:ny_times_app/app/ny_times_api/repository/base_repository_impl.dart';
import 'package:ny_times_app/app/ny_times_api/response/ny_times_model.dart';

class NyTimesApi extends BaseRepositoryImpl {
  @override
  Future<NyTimesModel?>? mostPopular([int? period = 7]) async {
    try {
      final response = await manager.get('$period.json?api-key=${AC.apiKey}');
      if (response.data != null && response.statusCode == 200) {
        return NyTimesModel.fromJson(response.data);
      }
      throw Exception(response.data.toString());
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
