import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/medicin.dart';

class MedicinInfoScreen extends StatefulWidget {
  final int index;

  const MedicinInfoScreen({Key? key, required this.index}) : super(key: key);

  @override
  State<MedicinInfoScreen> createState() => _MedicinInfoScreenState();
}

class _MedicinInfoScreenState extends State<MedicinInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: kkBlue,
        title: const Text("Medicine info",style: TextStyle(color: Colors.white),),
      ),
      body: Container(
        padding: const EdgeInsets.all(25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network('${medicine.elementAt(widget.index)['medImg']}',width: 120,height: 120),
              const SizedBox(height: 20),
              const Text(
                "Usage:",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: kkBlue,
                ),
              ),
              const SizedBox(height: 10),
              Text('${medicine.elementAt(widget.index)['usage']}'),
              const SizedBox(height: 30),
              const Text(
                "side effect:",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: kkBlue,
                ),
              ),
              Text('${medicine.elementAt(widget.index)['side effect']}'),
              const SizedBox(height: 30),
              const Text(
                "dosage:",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: kkBlue,
                ),
              ),
              Text('${medicine.elementAt(widget.index)['dosage']}'),
            ],
          ),
        ),
      ),
    );
  }
}
