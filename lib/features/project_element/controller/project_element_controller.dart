import 'package:get/get.dart';
import 'package:scube_technologies_task/features/project_element/model/project_element_model.dart';
import 'package:scube_technologies_task/services/network_caller.dart';
import 'package:scube_technologies_task/services/network_response.dart';
import 'package:scube_technologies_task/services/app_urls.dart';

class ProjectElementController extends GetxController{
  bool _isLoading = false;
  List<ProjectElementsModel> _projectElementList = [];
  String _errorMessage = '';

  bool get isLoading => _isLoading;
  List<ProjectElementsModel> get projectElementList => _projectElementList;
  String get errorMessage => _errorMessage;

  @override
  void onInit(){
    fetchProjectData();
    super.onInit();
  }

  Future<bool>fetchProjectData() async{
    _isLoading = true;
    update();

    NetworkResponse response = await NetworkCaller.getRequest(AppUrls.projectElementsUrl);

    _isLoading = false;
    if(response.isSuccess){
      List<dynamic>jsonData = response.body;
      _projectElementList = jsonData.map((apiData) => ProjectElementsModel.fromJson(apiData)).toList();
      update();
      return true;
    }else{
      _errorMessage = 'Data can\'t fetch';
      update();
      return false;
    }
  }

}