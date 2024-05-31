import 'dart:io';

import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:image_picker/image_picker.dart';

import '../constants/colors.dart';
import '../constants/messages.dart';
import 'package:intl/intl.dart';

class NewChatScreen extends StatefulWidget {
  const NewChatScreen({Key? key}) : super(key: key);

  @override
  State<NewChatScreen> createState() => _NewChatScreenState();
}

class _NewChatScreenState extends State<NewChatScreen> {
  File? _image;
  List<Message> messages = [];

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, title: const Text("Hello")),
      body: Column(
        children: [
          Expanded(
              child: GroupedListView<Message, DateTime>(
            padding: const EdgeInsets.all(8),
            reverse: true,
            order: GroupedListOrder.DESC,
            elements: messages,
            groupBy: (message) => DateTime(
              message.date.year,
              message.date.month,
              message.date.day,
            ),
            groupHeaderBuilder: (Message message) => SizedBox(
              height: 40,
              child: Center(
                  child: Card(
                color: kkBlue,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    DateFormat.yMMMd().format(message.date),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              )),
            ),
            itemBuilder: (context, Message message) => Align(
              alignment: message.isSentByMe
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Card(
                // ----------------------
                color: message.isSentByMe == true
                    ? Colors.blue
                    : Colors.grey.shade300,
                elevation: 8,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  // ------------------------------------
                  child: message.image ?? Text(message.text),
                ),
              ),
            ),
          )),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  pickImage();
                },
                icon: const Icon(Icons.add),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(30)),
                  child: TextFormField(
                    controller: controller,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.all(12),
                      hintText: 'Type your message here...',
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  if (controller.text.isNotEmpty) {
                    final message = Message(
                        text: controller.text,
                        date: DateTime.now(),
                        isSentByMe: true,
                        image: null);
                    setState(() {
                      messages.add(message);
                      controller.clear();
                      if (messages.length == 1) {
                        messages.add(
                          Message(
                            text: "Hello patient how can i help you?",
                            date: DateTime.now()
                                .subtract(const Duration(minutes: 1)),
                            isSentByMe: false,
                            image: null,
                          ),
                        );
                      }
                    });
                  }
                },
                icon: Icon(
                  Icons.send,
                  color: iconColor(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void pickImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      File? img = File(image.path);
      setState(() {
        _image = img;
        messages.add(
          Message(
            text: "",
            date: DateTime.now().subtract(const Duration(minutes: 1)),
            isSentByMe: true,
            image: Image(
              image: FileImage(_image!),
              fit: BoxFit.fill,
              height: 100,
              width: 100,
            ),
          ),
        );
      });
    }
  }

  Color iconColor() {
    Color color = Colors.grey;
    setState(() {
      color = controller.text.isEmpty ? Colors.grey : Colors.blue;
    });
    return Colors.blue;
  }
}
