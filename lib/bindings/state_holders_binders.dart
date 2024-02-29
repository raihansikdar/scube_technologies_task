import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:scube_technologies_task/features/add_project_elements/controller/add_info_controller.dart';
import 'package:scube_technologies_task/features/project_element/controller/project_element_controller.dart';
import 'package:scube_technologies_task/features/update_project_elements/controller/update_info_controller.dart';

class StateHoldersBinders extends Bindings{
  @override
  void dependencies() {
      Get.put(ProjectElementController());
      Get.put(AddInfoController());
      Get.put(UpdateInfoController());
  }

}