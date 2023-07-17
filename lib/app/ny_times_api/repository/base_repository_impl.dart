
import 'package:ny_times_app/app/ny_times_api/response/ny_times_model.dart';

import '../network_manager.dart';

abstract class BaseRepositoryImpl {
  final NetworkManager manager = NetworkManager();

  /*
  * Ny Times Most Popular Api
  */
  Future<NyTimesModel?>? mostPopular([int? period = 7]);
}