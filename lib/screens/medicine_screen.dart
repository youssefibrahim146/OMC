import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../constants/medicin.dart';
import 'medicin_info_screen.dart';
import 'replacement_screen.dart';

class MedicineScreen extends StatefulWidget {
  const MedicineScreen({Key? key}) : super(key: key);

  @override
  State<MedicineScreen> createState() => _MedicineScreenState();
}

class _MedicineScreenState extends State<MedicineScreen> {
  // int? indexx;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KBlueBg,
      appBar: AppBar(elevation: 0, backgroundColor: KBlueBg),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          // --------- background-------------
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8, vertical: 10),
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
                    "Medicine",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 23,
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: medicine.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 11,
                      mainAxisExtent: 180,
                    ),
                    itemBuilder: (context, index) {
                      //indexx = index;
                      return medicineContainer(
                        index: index,
                        medName: '${medicine.elementAt(index)['medName']}',
                        medImg: '${medicine.elementAt(index)['medImg']}',
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget medicineContainer({required String medName, required String medImg,required int index}) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(7),
      height: 165,
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
                medImg,
                fit: BoxFit.fill,
                //width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  medName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 17),
                  textAlign: TextAlign.center,
                ),
                //----------- info ---------
                ElevatedButton(
                  onPressed: () {
                    Get.to( MedicinInfoScreen(index: index,));
                  },
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 6)),
                      elevation: MaterialStateProperty.all(1),
                      backgroundColor:
                      MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)))),
                  child: const Text(
                    'Medicine info',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 13,
                    ),
                  ),
                ),
                // ------------- replacement -----------
                ElevatedButton(
                  onPressed: () {
                    Get.to( ReplacementScreen(index: index,));
                  },
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 6)),
                      elevation: MaterialStateProperty.all(1),
                      backgroundColor:
                      MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)))),
                  child: const Text(
                    'Replacement',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
