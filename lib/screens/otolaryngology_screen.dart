import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import 'new_chat_screen.dart';

class OtolaryngologyScreen extends StatelessWidget {
  const OtolaryngologyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kprimaryColor,
      appBar: AppBar(elevation: 0, backgroundColor: kprimaryColor),
      body: Center(
        child: Column(
          children: [
            Container(
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
                  const Text(
                    "Otolaryngology",
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(width: 5),
                  SizedBox(
                    height: 60,
                    child: Image.asset("assets/images/Otolaryngology.png"),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11),
                color: kSecondaryColor,
              ),
              child: const Text(
                "Available Doctors",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // ------------------
                      drContainer(
                        drName: 'Dr. Hamza',
                        drImg:
                        'https://cdn.siasat.com/wp-content/uploads/2023/04/Dr-Sudhir-Kumar.png',
                      ),drContainer(
                        drName: 'Dr. Saif',
                        drImg:
                        'https://www.kauveryhospital.com/doctorimage/recent/salem/Dr_P_V_Dhanapal.jpg',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget drContainer({required String drName, required String drImg}) {
    return InkWell(
      onTap: (){
        Get.to(const NewChatScreen());
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        height: 110,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 0),
                color: Colors.black26,
                spreadRadius: 1,
                blurRadius: 15,
              )
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 190,
              width: Get.width / 2.5,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  drImg,
                  fit: BoxFit.fill,
                  //width: double.infinity,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  Text(
                    drName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 17),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 1),
                  const Text(
                    'Specialist: \n Otolaryngology',
                    style: TextStyle(fontWeight: FontWeight.w700),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
