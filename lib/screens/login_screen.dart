/*
 * © 2023 Yared Kassa Legesse - LDS. All rights reserved.
 * This code is protected by copyright law and may not be reproduced or distributed without permission.
 */
import 'dart:async';

import 'package:bell_et_social_media_101/screens/registration_screen.dart';
import 'package:bell_et_social_media_101/screens/tools/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/countries.dart';
import '../classes/encryption.dart';
import '../constants/coors.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../widgets/bellInputField.dart';
import '../widgets/bellPhoneInput.dart';
import '../widgets/bellButton.dart';
import '../widgets/bellRegistrationFigure.dart';
import 'Home/mainu.dart';
import 'tools/loading.dart';
// import 'home.dart';
// import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

final _formKey = GlobalKey<FormState>();
bool phone = false;

class _LoginScreenState extends State<LoginScreen> {
  String phoneInput = '';
  bool loginPhoneError = false;
  // bool loginPasswordError = false;
  final _userPhoneController = TextEditingController();
  // final _userPasswordController = TextEditingController();
  // final _fullPhoneValue = String();


  // @override
  // void dispose() {
  //   _userPhoneController.dispose();
  //   // _userPasswordController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final ResponsiveHelper responsiveHelper =
        ResponsiveHelper(context: context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        // child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Expanded(
              // <-- Use Expanded with SizedBox.expand
              child: SizedBox.expand(
                child: CustomPaint(
                  painter: bellRegistrationFigure(),
                  child: Column(
                    // Vertically center the widget inside the column
                    mainAxisAlignment: MainAxisAlignment.center,
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Container(
                                width: 400,
                                child: Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      margin: const EdgeInsets.only(bottom: 30),
                                      child: const Text(
                                        'መግቢያ / Login',
                                        style: TextStyle(
                                          color: bellBlue,
                                          fontSize: 21,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    bellPhoneInput(
                                      onPhoneChange: (String phone) {
                                        setState(() {
                                          phoneInput = phone;
                                          loginPhoneError = false;
                                        });
                                      },
                                      // onCountryChange: (Country country){
                                      //   setState(() { selectedCountryCode = country.code; });
                                      // },
                                      id: _userPhoneController,
                                      errorText: loginPhoneError
                                          ? 'This phone number is Not Registered'
                                          : null,
                                    ),
                                    // bellInputField(
                                    //     id: _userPasswordController,
                                    //     type: 'password',
                                    //     validator: (value) {
                                    //       if (value == null || value.isEmpty) {
                                    //         return 'You Must Provide some Values!';
                                    //       } else if (loginPasswordError) {
                                    //         return 'Your password is wrong!';
                                    //       } else {
                                    //         return null;
                                    //       }
                                    //     },
                                    //     hideInputText: true,
                                    //     inputIcon: Icons.error,
                                    //     helpingText: 'Provide Your Password',
                                    //     inputFontSize: 14,
                                    //     inputHintText: 'Password'),
                                    bellButton(
                                      bellButtonText: "አስገባኝ / Login",
                                      bellButtonColor: bellBlue,
                                      textSize: 15,
                                      bellButtonElevation: 3,
                                      callback: () async {
                                        if (_formKey.currentState!.validate()) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                            content: Text(
                                                'ጥያቄዎትን በማስተናገድ ላይ ነን። / Processing Request.'),
                                          ));
                                          ProcessDialog.showLoadingDialog(context);

                                          Timer(
                                            Duration(seconds: 5),
                                              ()=> ProcessDialog.closeLoadingDialog(context),
                                          );
                                        }
                                        // String password =
                                        //     _userPasswordController.text
                                        //         .toString();
                                        String phone = _userPhoneController.text
                                            .toString();
                                        // var encryptedPassword = Encryption
                                        //     .instance
                                        //     .encrypt(password);
                                        // var decryptedPassword = Encryption
                                        //     .instance
                                        //     .decrypt(encryptedPassword);

                                        // password.isNotEmpty && phone.isNotEmpty
                                        //     ? print(
                                        //         'user Phone Number is: $phone \n '
                                        //         'and user provided password is: $password \n'
                                        //         'and user Encrypted password is: $encryptedPassword \n'
                                        //         'and user decrypted password is: $decryptedPassword \n')
                                        //     : print(
                                        //         'One of the Field is Empty!');

                                        // () async {
                                        var url = Uri.http('127.0.0.1',
                                            'newlab/bell_api/index.php'); //?instruct=user&request=GET&id=1');
                                        var response =
                                            await http.post(url, body: {
                                          'instruct': 'user',
                                          'request': 'GET',
                                          'function': 'LOGIN',
                                          'phone': phoneInput,
                                          'password': '#pass'
                                        });
                                        print(
                                            'Response status: ${response.statusCode}');
                                        print(
                                            'Response body: ${response.body}');

                                        setState(() {
                                          loginPhoneError = false;
                                          // loginPasswordError = false;
                                        });

                                        var res = json.decode(response.body);
                                        if (res['flag'] == 'Success') {
                                          // ignore: use_build_context_synchronously
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => MyApp()),
                                          );
                                        } else {
                                          setState(() {
                                            loginPhoneError = true;
                                            // loginPasswordError = true;
                                          });
                                        }
                                        // print('flag-> ${res['flag']}');
                                      },
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 25),
                                            alignment: Alignment.bottomLeft,
                                            child: TextButton(
                                              child: const Text(
                                                  "ለመመዝገብ እዚጋ ይንኩ / To Register Press Here"),
                                              style: TextButton.styleFrom(
                                                  foregroundColor: bellBlue,
                                                  textStyle: const TextStyle(
                                                    fontSize: 13,
                                                  )),
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const RegistrationScreen()),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
          // ),
        ),
      ),
    );
  }

  buttonPressed(String buttonText) {
    print(buttonText);
    setState(() {});
  }

  Future<void> login() async {
    final formState = _formKey.currentState;
    if (formState!.validate()) {
      formState?.save();

      setState(() {
        // loginfail = true; //loginfail is bool
      });
    }
  }
}
