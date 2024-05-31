import 'package:flutter/material.dart';

class Message {
  final String text;
  final DateTime date;
  final bool isSentByMe;
  final Image? image;

  const Message({required this.text, required this.date,required this.isSentByMe,required this.image});
}