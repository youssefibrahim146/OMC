import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/medicin.dart';

class ReplacementScreen extends StatefulWidget {
  final int index;

  const ReplacementScreen({Key? key, required this.index}) : super(key: key);

  @override
  State<ReplacementScreen> createState() => _ReplacementScreenState();
}

class _ReplacementScreenState extends State<ReplacementScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: kkBlue,
        title: const Text(
          "Replacement",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(25),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                '${medicine.elementAt(widget.index)['replacement title']}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: kkBlue,
                ),
              ),
              Image.network(
                  '${medicine.elementAt(widget.index)['replacement image']}',
                  width: 130,
                  height: 130),
            ],
          ),
        ),
      ),
    );
  }
}
