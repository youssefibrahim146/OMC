import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import 'signup_as_doctor.dart';
import 'signup_as_patient.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0,backgroundColor: kkBlue),
      body: Container(
        padding: const EdgeInsets.only(left: 15,right: 15,bottom: 110),
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          // --------- background-------------
          image: DecorationImage(
            image: AssetImage('assets/images/bg.PNG'),
            fit: BoxFit.fill,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.to(const SignUpAsDoctor());
              },
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 8)),
                  elevation: MaterialStateProperty.all(1),
                  backgroundColor:
                  MaterialStateProperty.all(kkBlue),
                  shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)))),
              child: const Text(
                'As Doctor',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(const SignupASPatient());
              },
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 8)),
                  elevation: MaterialStateProperty.all(1),
                  backgroundColor:
                  MaterialStateProperty.all(kkBlue),
                  shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)))),
              child: const Text(
                'As Patient',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
