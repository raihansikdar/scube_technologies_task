import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scube_technologies_task/services/app_urls.dart';
import 'package:scube_technologies_task/services/network_caller.dart';
import 'package:scube_technologies_task/services/network_response.dart';

class UpdateInfoController extends GetxController {
  TextEditingController _updateProjectNameTEController = TextEditingController();
  TextEditingController _updateAssignedEngineerTEController = TextEditingController();
  TextEditingController _updateAssignedTechnicianTEController = TextEditingController();
  TextEditingController _updateStartDateTEController = TextEditingController();
  TextEditingController _updateEndDateTEController = TextEditingController();
  TextEditingController _updateProjectUpdateTEController = TextEditingController();


  TextEditingController get updateProjectNameTEController => _updateProjectNameTEController;
  TextEditingController get updateAssignedEngineerTEController => _updateAssignedEngineerTEController;
  TextEditingController get updateAssignedTechnicianTEController => _updateAssignedTechnicianTEController;
  TextEditingController get updateStartDateTEController => _updateStartDateTEController;
  TextEditingController get updateEndDateTEController => _updateEndDateTEController;
  TextEditingController get updateProjectUpdateTEController => _updateProjectUpdateTEController;


  void initControllers({
    required String projectName,
    required String assignedEngineer,
    required String assignedTechnician,
    required String startDate,
    required String endDate,
    required String projectUpdate,
  }) {
    _updateProjectNameTEController.text = projectName;
    _updateAssignedEngineerTEController.text = assignedEngineer;
    _updateAssignedTechnicianTEController.text = assignedTechnician;
    _updateStartDateTEController.text = startDate;
    _updateEndDateTEController.text = endDate;
    _updateProjectUpdateTEController.text = projectUpdate;
  }



  void pickDate(TextEditingController controller, BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2130),
    );

    if (selectedDate != null) {
      String formattedDate = DateFormat("yyyy-MM-dd").format(selectedDate);
      controller.text = formattedDate;
    }

    update();
  }

  void pickStartDate(BuildContext context) {
    pickDate(_updateStartDateTEController, context);
  }

  void pickEndDate(BuildContext context) {
    pickDate(_updateEndDateTEController, context);
  }

  bool _isLoading = false;
  String _message = '';

  bool get isLoading => _isLoading;
  String get message => _message;

  Future<bool> updateInfo({required int id,required String projectName,required String assignedEngineer,required String assignedTechnician,required String startDate,required String endDate,required String projectUpdate,})async{

    _isLoading = true;
    update();

    Map<String,dynamic> body = {
      "start_date": startDate,
      "end_date": endDate,
      "project_name": projectName,
      "project_update": projectUpdate,
      "assigned_engineer": assignedEngineer,
      "assigned_technician": assignedTechnician
    };

    NetworkResponse response = await NetworkCaller.putRequest(AppUrls.updateProjectElementsUrl(id: id), body);

    _isLoading = false;

    if(response.isSuccess){
      _message = 'Information has been updated Successfully.';
      update();
      return true;
    }else{
      _message = 'Information has been updated failed.';
      update();
      return false;
    }
  }
}


