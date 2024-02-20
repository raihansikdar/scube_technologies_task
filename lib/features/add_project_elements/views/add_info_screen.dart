import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scube_technologies_task/features/add_project_elements/controller/add_info_controller.dart';
import 'package:scube_technologies_task/utils/custom_size_extention.dart';

class AddInfoScreen extends StatelessWidget {
   AddInfoScreen({Key? key}) : super(key: key);

  TextEditingController _projectNameTEController = TextEditingController();
  TextEditingController _assignedEngineerTEController = TextEditingController();
  TextEditingController _assignedTechnicianTEController = TextEditingController();
  TextEditingController _startDateTEController = TextEditingController();
  TextEditingController _endDateTEController = TextEditingController();
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
                      controller: _projectNameTEController,
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
                             _addInfoController.datePicker(context);
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
                              _addInfoController.pickStartDate(context);
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
                    ElevatedButton(onPressed: (){
                      if(!_formKey.currentState!.validate()){
                        return;
                      }else{

                      }
                    }, child: update == 'update'  ? Text('Update') : Text('Submit'))
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
