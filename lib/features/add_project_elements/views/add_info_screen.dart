import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scube_technologies_task/common_widgets/circular_inside_buttonWidget.dart';
import 'package:scube_technologies_task/features/add_project_elements/controller/add_info_controller.dart';
import 'package:scube_technologies_task/features/project_element/controller/project_element_controller.dart';
import 'package:scube_technologies_task/features/update_project_elements/controller/update_info_controller.dart';
import 'package:scube_technologies_task/utils/app_toast.dart';
import 'package:scube_technologies_task/utils/custom_size_extention.dart';

class AddInfoScreen extends StatelessWidget {
  final int? id;
  final String? projectName;
  final String? assignedEngineer;
  final String? assignedTechnician;
  final String? startDate;
  final String? endDate;
  final String? projectUpdate;

  AddInfoScreen({Key? key,  this.id, this.projectName, this.assignedEngineer, this.assignedTechnician, this.startDate, this.endDate, this.projectUpdate}) : super(key: key);

  GlobalKey<FormState>_formKey =GlobalKey<FormState>();

   String update = Get.arguments ?? '';
  final UpdateInfoController _updateInfoController = Get.find<UpdateInfoController>();


   @override
  Widget build(BuildContext context) {
     if (update == 'update') {
       _updateInfoController.initControllers(
         projectName: projectName ?? '',
         assignedEngineer: assignedEngineer ?? '',
         assignedTechnician: assignedTechnician ?? '',
         startDate: startDate ?? '',
         endDate: endDate ?? '',
         projectUpdate: projectUpdate ?? '',
       );
     }
    return Scaffold(
      appBar: AppBar(
        title: update == 'update' ? const Text('Update Info') : const Text('Add Info'),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.rSp),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: GetBuilder<AddInfoController>(
              builder: (_addInfoController) {
                return Column(
                  children: [
                    TextFormField(
                      controller: update == 'update' ? _updateInfoController.updateProjectNameTEController : _addInfoController.projectNameTEController,
                      decoration: const InputDecoration(
                        labelText: 'Project Name'
                      ),
                      validator: (String? value){
                        if(value?.isEmpty ?? true){
                         return 'This field is mandatory';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.rSp,),
                    TextFormField(
                      controller:update == 'update' ? _updateInfoController.updateAssignedEngineerTEController : _addInfoController.assignedEngineerTEController,
                      decoration: const InputDecoration(
                          labelText: 'Assigned Engineer'
                      ),
                      validator: (String? value){
                        if(value?.isEmpty ?? true){
                          return 'This field is mandatory';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.rSp,),
                    TextFormField(
                      controller:update == 'update' ? _updateInfoController.updateAssignedTechnicianTEController : _addInfoController.assignedTechnicianTEController,
                      decoration: const InputDecoration(
                          labelText: 'Assigned Technician'
                      ),
                      validator: (String? value){
                        if(value?.isEmpty ?? true){
                          return 'This field is mandatory';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.rSp,),

                   Row(
                     children: [
                       Expanded(
                         child: TextFormField(
                           controller:update == 'update' ? _updateInfoController.updateStartDateTEController : _addInfoController.startDateTEController,
                           decoration: const InputDecoration(
                               labelText: 'Start Date'
                           ),
                           validator: (String? value){
                             if(value?.isEmpty ?? true){
                               return 'This field is mandatory';
                             }
                             return null;
                           },

                         ),
                       ),
                       SizedBox(width: 10.rSp,),
                       GestureDetector(
                           onTap: (){
                             if(update == 'update'){
                               _updateInfoController.pickStartDate(context);
                             }else{
                               _addInfoController.pickStartDate(context);
                             }
                           },
                           child: Icon(Icons.calendar_month,size: 40.rSp,)),
                     ],
                   ),
                    SizedBox(height: 16.rSp,),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller:update == 'update' ? _updateInfoController.updateEndDateTEController : _addInfoController.endDateTEController,
                            decoration: const InputDecoration(
                                labelText: 'End Date'
                            ),
                            validator: (String? value){
                              if(value?.isEmpty ?? true){
                                return 'This field is mandatory';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(width: 10.rSp,),
                        GestureDetector(
                            onTap: (){
                              if(update == 'update'){
                                _updateInfoController.pickEndDate(context);
                              }else{
                                _addInfoController.pickEndDate(context);
                              }

                            },
                            child: Icon(Icons.calendar_month,size: 40.rSp,),),
                      ],
                    ),
                    SizedBox(height: 16.rSp,),
                    TextFormField(
                      controller:update == 'update' ? _updateInfoController.updateProjectUpdateTEController :  _addInfoController.projectUpdateTEController,
                      maxLines: 3,
                      decoration: const InputDecoration(
                          labelText: 'Project Update',
                        alignLabelWithHint: true,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                      ),
                      validator: (String? value){
                        if(value?.isEmpty ?? true){
                          return 'This field is mandatory';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.rSp,),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(onPressed: () async{
                        if(!_formKey.currentState!.validate()){
                          return;
                        }else{
                         final response = await (update == 'update' ? _updateInfoController.updateInfo(
                                    id: id ?? 0,
                                    projectName: _updateInfoController.updateProjectNameTEController.text.trim(),
                                    assignedEngineer: _updateInfoController.updateAssignedEngineerTEController.text.trim(),
                                    assignedTechnician: _updateInfoController.updateAssignedEngineerTEController.text.trim(),
                                    startDate: _updateInfoController.updateStartDateTEController.text.trim(),
                                    endDate: _updateInfoController.updateEndDateTEController.text.trim(),
                                    projectUpdate: _updateInfoController.updateProjectUpdateTEController.text.trim(),
                         )
                                : _addInfoController.addInfo(projectName: _addInfoController.projectNameTEController.text.trim(),
                              assignedEngineer: _addInfoController.assignedEngineerTEController.text.trim(),
                              assignedTechnician: _addInfoController.assignedTechnicianTEController.text.trim(),
                              startDate: _addInfoController.startDateTEController.text.trim(),
                              endDate: _addInfoController.endDateTEController.text.trim(),
                              projectUpdate: _addInfoController.projectUpdateTEController.text.trim(),
                         ));
                         if(response){
                           if(update == 'update'){
                             _updateInfoController.updateProjectNameTEController.clear();
                             _updateInfoController.updateAssignedEngineerTEController.clear();
                             _updateInfoController.updateAssignedTechnicianTEController.clear();
                             _updateInfoController.updateStartDateTEController.clear();
                             _updateInfoController.updateEndDateTEController.clear();
                             _updateInfoController.updateProjectUpdateTEController.clear();
                             
                             AppToast.successToast(_updateInfoController.message);
                             
                           }else{
                             _addInfoController.projectNameTEController.clear();
                             _addInfoController.assignedEngineerTEController.clear();
                             _addInfoController.assignedTechnicianTEController.clear();
                             _addInfoController.startDateTEController.clear();
                             _addInfoController.endDateTEController.clear();
                             _addInfoController.projectUpdateTEController.clear();
                             
                             AppToast.successToast(_addInfoController.message);
                           }

                           
                           Navigator.pop(context);
                           Get.find<ProjectElementController>().fetchProjectData();
                         }else{
                          update == 'update' ? AppToast.failedToast(_updateInfoController.message) :  AppToast.failedToast(_addInfoController.message);
                         }
                        }
                      }, child: update == 'update'  ? const Text('Update') : _addInfoController.isLoading ? const CircularInsideButtonWidget() : const Text('Submit')),
                    )
                  ],
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}
