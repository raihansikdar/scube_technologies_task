import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddInfoController extends GetxController {
  TextEditingController _startDateTEController = TextEditingController();
  TextEditingController _endDateTEController = TextEditingController();

  TextEditingController get startDateTEController => _startDateTEController;
  TextEditingController get endDateTEController => _endDateTEController;

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
}
