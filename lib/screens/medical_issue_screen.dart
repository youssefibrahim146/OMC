import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omc/screens/pectoral_screen.dart';

import '../constants/colors.dart';
import 'dermatologist_screen.dart';
import 'esoteric_screen.dart';
import 'orthopedic_surgery.dart';
import 'otolaryngology_screen.dart';

class MedicalIssueScreen extends StatelessWidget {
  const MedicalIssueScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KlightBlue,
      appBar: AppBar(elevation: 0, backgroundColor: KlightBlue),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(0, 0),
                        color: Colors.black12,
                        blurRadius: 30,
                        spreadRadius: 1)
                  ],
                  color: kSecondaryColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Text(
                  "Medical Issue",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 23,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              // --------  issue bars ------------
              issueBar(
                title: 'Orthopedic Surgery',
                image: "assets/images/orthopedic-icon.jpg",
                onTap: () {
                  Get.to(const OrthopedicSurgery());
                },
              ),
              issueBar(
                title: 'Esoteric',
                image: "assets/images/esoteric.png",
                onTap: () {
                  Get.to(const EsotericScreen());
                },
              ),
              issueBar(
                title: 'Otolaryngology',
                image: "assets/images/Otolaryngology.png",
                onTap: () {
                  Get.to(const OtolaryngologyScreen());
                },
              ),
              issueBar(
                title: 'Pectoral',
                image: "assets/images/Pectoral.png",
                onTap: () {
                  Get.to(const PectoralScreen());
                },
              ),
              issueBar(
                title: 'Dermatologist',
                image: "assets/images/Dermatologist.png",
                onTap: () {
                  Get.to(const DermatologistScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget issueBar(
      {required String title,
      required String image,
      required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(25),
        width: Get.width - 15,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          color: kSecondaryColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(width: 5),
            Row(
              children: [
                SizedBox(
                  height: 60,
                  child: Image.asset(image),
                ), //3.5
                const SizedBox(width: 10),
                const Icon(Icons.arrow_forward_ios_rounded, size: 30),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
