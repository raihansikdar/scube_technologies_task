import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:scube_technologies_task/utils/app_exception.dart';

mixin InternetConnectivityCheckMixin {
   internetConnectivityCheck() async {
    final connectivity = Get.find<Connectivity>();
    final connectivityResult = await connectivity.checkConnectivity();

    if (connectivityResult == ConnectivityResult.none) {
      throw AppException("Internet connection lost");
    }
  }
}