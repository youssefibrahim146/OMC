import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../constants/colors.dart';
import 'home_screen.dart';

class SignUpAsDoctor extends StatefulWidget {
  const SignUpAsDoctor({Key? key}) : super(key: key);

  @override
  State<SignUpAsDoctor> createState() => _SignUpAsDoctorState();
}

class _SignUpAsDoctorState extends State<SignUpAsDoctor> {
  File? _image;

  @override
  Widget build(BuildContext context) {
    TextEditingController _fullNameController = TextEditingController();
    TextEditingController _specialistController = TextEditingController();
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    TextEditingController _reTypePasswordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(elevation: 0, backgroundColor: kprimaryColor),
      body: SafeArea(
        top: false,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            // --------- background-------------
            image: DecorationImage(
              image: AssetImage('assets/images/signup.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Sign Up',
                  style: TextStyle(
                      fontSize: bigTxtSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(height: 15),
                // --------------  image picker -------------
                Container(
                  width: 100,
                  height: 100,
                  color: kSecondaryColor,
                  child: _image == null
                      ? IconButton(
                          icon: const Icon(Icons.photo_camera),
                          onPressed: () {
                            pickImage();
                          },
                        )
                      : Image(image: FileImage(_image!), fit: BoxFit.fill),
                ),
                // --------------- name -----------------------------
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 1, horizontal: 15),
                  margin:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 45),
                  decoration: BoxDecoration(
                      color: kSecondaryColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextFormField(
                    controller: _fullNameController,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      hintText: 'Full Name',
                      border: InputBorder.none,
                      hintMaxLines: 1,
                    ),
                  ),
                ),
                // ---------------- Last Name ---------------------
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 1, horizontal: 15),
                  margin:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 45),
                  decoration: BoxDecoration(
                      color: kSecondaryColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextFormField(
                    controller: _specialistController,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      hintText: 'Your Specialist',
                      border: InputBorder.none,
                      hintMaxLines: 1,
                    ),
                  ),
                ),
                // --------------   email field ---------------------
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 1, horizontal: 15),
                  margin:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 45),
                  decoration: BoxDecoration(
                      color: kSecondaryColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: 'Email',
                      border: InputBorder.none,
                      hintMaxLines: 1,
                    ),
                  ),
                ),
                // -------------  password field -------------
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 1, horizontal: 15),
                  margin: const EdgeInsets.only(
                      top: 7, bottom: 20, left: 45, right: 45),
                  decoration: BoxDecoration(
                      color: kSecondaryColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Password',
                      border: InputBorder.none,
                      hintMaxLines: 1,
                    ),
                  ),
                ),
                // ------------ re type your password ----------
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 1, horizontal: 15),
                  margin: const EdgeInsets.only(
                      top: 7, bottom: 20, left: 45, right: 45),
                  decoration: BoxDecoration(
                      color: kSecondaryColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextFormField(
                    controller: _reTypePasswordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Re-enter Password',
                      border: InputBorder.none,
                      hintMaxLines: 1,
                    ),
                  ),
                ),
                //------------------ image --------------------
                Image.asset("assets/images/signup image.png", scale: 1),
                // ---------------- signup button -----------------
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    if (_fullNameController.text.isNotEmpty &&
                        _specialistController.text.isNotEmpty &&
                        _emailController.text.isNotEmpty &&
                        _passwordController.text.isNotEmpty &&
                        _reTypePasswordController.text.isNotEmpty) {
                      try {
                        if (_passwordController.text ==
                                _reTypePasswordController.text &&
                            _emailController.text.isNotEmpty) {
                          FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: _emailController.text,
                                  password: _passwordController.text)
                              .then((value) {
                                return Get.offAll(() => const HomeScreen());
                              });
                        }
                      } on FirebaseException catch (e) {
                        String eMessage = e.message!;
                        print(eMessage);
                        if (e.message ==
                            "The email address is already in use by another account.") {
                          eMessage = "The email address is already in use";
                        }else {
                          eMessage = e.message!;
                        }
                        if (e.message ==
                            "Password should be at least 6 characters") {
                          eMessage = "Password should be at least 6 characters";
                        }
                        Get.snackbar("!!! Error", eMessage,
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.white,
                            colorText: Colors.red);
                      }
                    }else{
                      Get.snackbar("!!! Error",
                                "Please make sure that all fields was entered",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.white,
                                colorText: Colors.red);
                    }
                  },
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              horizontal: 60, vertical: 8)),
                      elevation: MaterialStateProperty.all(1),
                      backgroundColor: MaterialStateProperty.all(kkBlue),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)))),
                  child: const Text(
                    'SignUp',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
                // -------------- or bar ---------------
                // Stack(
                //   alignment: Alignment.center,
                //   children: [
                //     Container(
                //       margin: const EdgeInsets.symmetric(
                //           horizontal: 30, vertical: 30),
                //       color: Colors.black,
                //       width: Get.width,
                //       height: 2,
                //     ),
                //     Container(
                //       padding: const EdgeInsets.all(5),
                //       decoration: BoxDecoration(
                //           color: kSecondaryColor,
                //           borderRadius: BorderRadius.circular(50),
                //           border: Border.all(color: Colors.black, width: 2.5)),
                //       child: const Text(
                //         'OR',
                //         style: TextStyle(
                //           color: Colors.black,
                //           fontWeight: FontWeight.bold,
                //         ),
                //       ),
                //     )
                //   ],
                // ),
                // //--------------- signup with google ---------------
                // ElevatedButton(
                //   onPressed: () {},
                //   style: ButtonStyle(
                //       backgroundColor:
                //           MaterialStateProperty.all(kSecondaryColor),
                //       shape: MaterialStateProperty.all(RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(10)))),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     mainAxisSize: MainAxisSize.min,
                //     children: [
                //       Image.asset('assets/images/google icon.png', scale: 42),
                //       const SizedBox(width: 4),
                //       const Text(
                //         'Continue with Google',
                //         style: TextStyle(color: Colors.black),
                //       ),
                //     ],
                //   ),
                // ),
                // const SizedBox(height: 15),
                // // ------------------ signup with facebook -------------------
                // ElevatedButton(
                //   onPressed: () {},
                //   style: ButtonStyle(
                //       backgroundColor:
                //           MaterialStateProperty.all(kSecondaryColor),
                //       shape: MaterialStateProperty.all(RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(10)))),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     mainAxisSize: MainAxisSize.min,
                //     children: [
                //       Image.asset('assets/images/facebook icon.png', scale: 25),
                //       const SizedBox(width: 4),
                //       const Text(
                //         'Continue with Facebook',
                //         style: TextStyle(color: Colors.black),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void pickImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      File? img = File(image.path);
      setState(() {
        _image = img;
      });
    }
  }
}
