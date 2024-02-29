import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scube_technologies_task/application/app.dart';

void main() {
  Get.put(Connectivity(), permanent: true);
  runApp(ScubeTechnologiesTask());
}



