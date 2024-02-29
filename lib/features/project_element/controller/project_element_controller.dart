import 'dart:developer';

import 'package:get/get.dart';
import 'package:scube_technologies_task/features/project_element/model/project_element_model.dart';
import 'package:scube_technologies_task/services/network_caller.dart';
import 'package:scube_technologies_task/services/network_response.dart';
import 'package:scube_technologies_task/services/app_urls.dart';
import 'package:scube_technologies_task/utils/app_exception.dart';
import 'package:scube_technologies_task/utils/internet_connectivity_check_mixin.dart';

class ProjectElementController extends GetxController with InternetConnectivityCheckMixin{
  bool _isLoading = false;
  bool _isConnected = true;
  bool _isError = false;
  List<ProjectElementsModel> _projectElementList = [];
  String _errorMessage = '';

  bool get isLoading => _isLoading;
  bool get isConnected => _isConnected;
  bool get isError => _isError;
  List<ProjectElementsModel> get projectElementList => _projectElementList;
  String get errorMessage => _errorMessage;

  @override
  void onInit(){
    fetchProjectData();
    super.onInit();
  }

  Future<bool> fetchProjectData() async {
    _isLoading = true;
    _isConnected = true;
    _isError = false;
    update();

    try {
      await internetConnectivityCheck();

      NetworkResponse response = await NetworkCaller.getRequest(AppUrls.projectElementsUrl);

        log("getRequest statusCode ==> ${response.statusCode}");
        log("getRequest body ==> ${response.body}");

      _isLoading = false;

      if (response.isSuccess) {
        List<dynamic> jsonData = response.body;
        _projectElementList = jsonData.map((apiData) => ProjectElementsModel.fromJson(apiData)).toList();
        update();
        return true;
      } else {
        _errorMessage = 'Data can\'t fetch';
        _isLoading = false;
        _isError = true;
        update();
        return false;
      }
    } catch (e) {
      _isConnected = false;
      _isLoading = false;

      _errorMessage = e.toString();
      if (e is AppException) {
        _errorMessage = e.error.toString();
      }

      print('Error in fetchProjectData: $_errorMessage');

      update();
      return false;

    }
  }

}