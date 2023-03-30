import 'dart:convert';
import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:dio/dio.dart';
import 'package:notaryappassignment/ui/companieswidget.dart';

class CompaniesController extends GetxController {
  late List<dynamic> companies = [];

  Future<void> makeApiCall() async {
    EasyLoading.show(status: 'loading');

    print('came');
    try {
      final response = await Dio().post(
        'https://notaryapp-staging.herokuapp.com/customer/login',
        data: {'email': 'demo@thenotary.app'},
      );

      if (response.statusCode == 200) {
        companies = response.data['data']['companiesList'] as List;
        log(companies.toString());
        await GetStorage().write('companies', companies);
        Get.to(CompaniesPage());
      } else {
        EasyLoading.showToast("API call failed");
      }
    } catch (e) {
      print(e.toString());
      EasyLoading.showToast(e.toString());
    } finally {
      EasyLoading.dismiss();
    }
  }
}
