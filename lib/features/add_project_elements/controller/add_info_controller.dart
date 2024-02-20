import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scube_technologies_task/services/app_urls.dart';
import 'package:scube_technologies_task/services/network_caller.dart';
import 'package:scube_technologies_task/services/network_response.dart';

class AddInfoController extends GetxController {
  TextEditingController _projectNameTEController = TextEditingController();
  TextEditingController _assignedEngineerTEController = TextEditingController();
  TextEditingController _assignedTechnicianTEController = TextEditingController();
  TextEditingController _startDateTEController = TextEditingController();
  TextEditingController _endDateTEController = TextEditingController();
  TextEditingController _projectUpdateTEController = TextEditingController();


  TextEditingController get projectNameTEController => _projectNameTEController;
  TextEditingController get assignedEngineerTEController => _assignedEngineerTEController;
  TextEditingController get assignedTechnicianTEController => _assignedTechnicianTEController;
  TextEditingController get startDateTEController => _startDateTEController;
  TextEditingController get endDateTEController => _endDateTEController;
  TextEditingController get projectUpdateTEController => _projectUpdateTEController;

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
    pickDate(_startDateTEController, context);
  }

  void pickEndDate(BuildContext context) {
    pickDate(_endDateTEController, context);
  }

  bool _isLoading = false;
  String _message = '';

  bool get isLoading => _isLoading;
  String get message => _message;



  Future<bool> addInfo({required String projectName,required String assignedEngineer,required String assignedTechnician,required String startDate,required String endDate,required String projectUpdate,})async{

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

    NetworkResponse response = await NetworkCaller.postRequest(AppUrls.addProjectElementsUrl, body);

    _isLoading = false;

    if(response.isSuccess){
      _message = 'Information has been added Successfully.';
      update();
      return true;
    }else{
      _message = 'Information has been added failed.';
      update();
      return false;
    }
  }
}
