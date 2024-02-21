import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scube_technologies_task/features/add_project_elements/views/add_info_screen.dart';
import 'package:scube_technologies_task/features/project_element/controller/project_element_controller.dart';
import 'package:scube_technologies_task/features/project_element/model/project_element_model.dart';
import 'package:scube_technologies_task/utils/custom_size_extention.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        backgroundColor: Colors.amber,
      ),
      body: DoubleBack(child: GetBuilder<ProjectElementController>(
          builder: (_projectElementController) {
            if(_projectElementController.isLoading){
              return const Center(child: CircularProgressIndicator());
            }
            return RefreshIndicator(
              onRefresh: ()async{
                await _projectElementController.fetchProjectData();
              },
              child: ListView.separated(
                itemCount: _projectElementController.projectElementList.length,
                itemBuilder: (context,index){
                  final ProjectElementsModel projectData = _projectElementController.projectElementList[index];
                  return Padding(
                    padding: EdgeInsets.all(12.rSp),
                    child: Card(
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(16.rSp),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Project Name : ${projectData.projectName ?? ''}"),
                                Text("Assigned Engineer : ${projectData.assignedEngineer ?? ''}"),
                                Text("Assigned Technician : ${projectData.assignedTechnician ?? ''}"),
                                Text("Start Date : ${projectData.startDate ?? ''}"),
                                Text("End Date : ${projectData.endDate ?? ''}"),
                                Text("Project Update : ${projectData.projectUpdate ?? ''}"),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: (){
                                Get.to(()=> AddInfoScreen(id: projectData.id ?? 0, projectName: projectData.projectName ?? '', assignedEngineer:projectData.assignedEngineer ?? '', assignedTechnician:projectData.assignedTechnician ?? '', startDate:projectData.startDate ?? '', endDate:projectData.endDate ??  '', projectUpdate:projectData.projectUpdate ?? '',),arguments: 'update');
                              },
                              child: Card(
                                elevation: 4,
                                color: Colors.amber,
                                child: Padding(
                                  padding: EdgeInsets.all(5.rSp),
                                  child: Icon(
                                    Icons.edit,
                                    size: 25.rSp,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),


                  );
                },
                separatorBuilder: (context,index)=> SizedBox(height: 8.rSp,), ),
            );
          }
      ),),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(()=>AddInfoScreen());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
