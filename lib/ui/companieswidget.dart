import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get_storage/get_storage.dart';

import '../controllers/controller.dart';

class CompaniesPage extends StatefulWidget {
  

  const CompaniesPage({super.key});

  @override
  State<CompaniesPage> createState() => _CompaniesPageState();
}

class _CompaniesPageState extends State<CompaniesPage> {
  String searchvalue = "";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CompaniesController>(
        init: CompaniesController(),
        builder: (companiesController) {
          return Scaffold(
          

            body: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const Text('Companies List'),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                      "${companiesController.companies.length} companies found"),
                  const SizedBox(
                    height: 15,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      suffixIcon: InkWell(
                          onTap: () {}, child: const Icon(Icons.search)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            const BorderSide(color: Colors.blue, width: 1),
                      ),
                      labelText: 'Search',
                    ),
                    onChanged: (value) async {
                      searchvalue = value;
                      final box = GetStorage();
                      var companies = box.read('companies');
                      final filteredCompanies = companies
                          ?.where((company) => company['name']
                                  .toLowerCase()
                                  .contains(searchvalue.toLowerCase())
                              ? true
                              : false)
                          .toList();
                      companiesController.companies = filteredCompanies;

                      setState(() {});
                    },
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: GetBuilder<CompaniesController>(
                      init: CompaniesController(),
                      builder: (controller) => ListView.builder(
                        itemCount: controller.companies.length,
                        itemBuilder: (context, index) {
                          final company = controller.companies[index];
                          return ListTile(
                            title: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.blue,
                                  width: 2.0,
                                ),
                                borderRadius:
                                  const  BorderRadius.all(Radius.circular(5)),
                                color: Colors.white,
                              ),
                              child: Center(
                                child: Text(
                                  company['name'],
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
