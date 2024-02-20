import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scube_technologies_task/common_widgets/circular_inside_buttonWidget.dart';
import 'package:scube_technologies_task/features/add_project_elements/controller/add_info_controller.dart';
import 'package:scube_technologies_task/features/project_element/controller/project_element_controller.dart';
import 'package:scube_technologies_task/utils/app_toast.dart';
import 'package:scube_technologies_task/utils/custom_size_extention.dart';

class AddInfoScreen extends StatelessWidget {
   AddInfoScreen({Key? key}) : super(key: key);

  TextEditingController _projectNameTEController = TextEditingController();
  TextEditingController _assignedEngineerTEController = TextEditingController();
  TextEditingController _assignedTechnicianTEController = TextEditingController();
  // TextEditingController _startDateTEController = TextEditingController();
  // TextEditingController _endDateTEController = TextEditingController();
  TextEditingController _projectUpdateTEController = TextEditingController();

  GlobalKey<FormState>_formKey =GlobalKey<FormState>();
   String update = Get.arguments ?? '';

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: update == 'update' ? Text('Update Info') : Text('Add Info'),
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
                      controller: _projectNameTEController,
                      decoration: InputDecoration(
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
                      controller: _assignedEngineerTEController,
                      decoration: InputDecoration(
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
                      controller: _assignedTechnicianTEController,
                      decoration: InputDecoration(
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
                           controller: _addInfoController.startDateTEController,
                           decoration: InputDecoration(
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
                             _addInfoController.pickStartDate(context);
                           },
                           child: Icon(Icons.calendar_month,size: 40.rSp,)),
                     ],
                   ),
                    SizedBox(height: 16.rSp,),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _addInfoController.endDateTEController,
                            decoration: InputDecoration(
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
                              _addInfoController.pickEndDate(context);
                            },
                            child: Icon(Icons.calendar_month,size: 40.rSp,),),
                      ],
                    ),
                    SizedBox(height: 16.rSp,),
                    TextFormField(
                      controller: _projectUpdateTEController,
                      maxLines: 3,
                      decoration: InputDecoration(
                          labelText: 'Project Update',
                        alignLabelWithHint: true,
                        contentPadding: const EdgeInsets.symmetric(
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
                         final response = await  _addInfoController.addInfo(projectName: _projectNameTEController.text.trim(),
                              assignedEngineer: _assignedEngineerTEController.text.trim(),
                              assignedTechnician: _assignedTechnicianTEController.text.trim(),
                              startDate: _addInfoController.startDateTEController.text.trim(),
                              endDate: _addInfoController.endDateTEController.text.trim(),
                              projectUpdate: _projectUpdateTEController.text.trim(),
                          );
                         if(response){
                           _projectNameTEController.clear();
                           _assignedEngineerTEController.clear();
                           _assignedTechnicianTEController.clear();
                           _addInfoController.startDateTEController.clear();
                           _addInfoController.endDateTEController.clear();
                           _projectUpdateTEController.clear();
                           AppToast.successToast(_addInfoController.message);
                           Navigator.pop(context);
                           Get.find<ProjectElementController>().fetchProjectData();
                         }else{
                           AppToast.failedToast(_addInfoController.message);
                         }
                        }
                      }, child: update == 'update'  ? Text('Update') : _addInfoController.isLoading ? CircularInsideButtonWidget() : Text('Submit')),
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
