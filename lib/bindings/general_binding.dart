import 'package:get/get.dart';
import 'package:prof_ecommerce/utils/network_manager/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
  }
}
