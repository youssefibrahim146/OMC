import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omc/constants/colors.dart';

import 'login_screen.dart';
import 'medical_issue_screen.dart';
import 'medicine_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, actions: [
        TextButton(
          child: const Text(
            "LogOut",
            style: TextStyle(color: Colors.black),
          ),
          onPressed: () {
            FirebaseAuth.instance.signOut().then((value) => Get.offAll(() => const LoginScreen()));
          },
        )
      ]),
      body: Container(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 60),
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          // --------- background-------------
          image: DecorationImage(
            image: AssetImage('assets/images/main scrn bg.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                // ----------------- what do you need ------------
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 9),
                  decoration: BoxDecoration(
                      border: Border.all(color: blackColor, width: 1.5),
                      borderRadius: BorderRadius.circular(40)),
                  child: const Text(
                    "What you need ?",
                    style: TextStyle(
                        fontWeight: FontWeight.w400, fontSize: bigTxtSize - 12),
                  ),
                ),
                Image.asset("assets/images/omc-logo (1).png", scale: 3),
              ],
            ),
            // ------------- row that have 2 buttons ----------
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () => Get.to(const MedicalIssueScreen()),
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 8)),
                      elevation: MaterialStateProperty.all(1),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)))),
                  child: const Text(
                    'Medical Issue',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 23,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Get.to(const MedicineScreen()),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8)),
                        elevation: MaterialStateProperty.all(1),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)))),
                    child: const Text(
                      'Medicine',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 23,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
