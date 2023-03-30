

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notaryappassignment/controllers/controller.dart';

class HomePage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CompaniesController>(
        init: CompaniesController(),
        builder: (companiesController) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 70,
                  ),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                        borderSide:
                            const BorderSide(color: Colors.black, width: 1),
                      ),
                      labelText: 'Email',
                    ),
                  ),
                  const SizedBox(height: 25),
                  InkWell(
                    onTap: () {
                      companiesController.makeApiCall();
                    },
                    child: Container(
                      height: 40,
                      width: 90,
                      decoration: const BoxDecoration(
                          color: Colors.black45,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: const Center(
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                  
                ],
              ),
            ),
          );
        });
  }
}
