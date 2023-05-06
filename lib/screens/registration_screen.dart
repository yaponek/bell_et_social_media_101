/*
 * © 2023 Yared Kassa Legesse - LDS. All rights reserved.
 * This code is protected by copyright law and may not be reproduced or distributed without permission.
 */
import 'package:bell_et_social_media_101/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/countries.dart';
import '../constants/coors.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../widgets/bellInputField.dart';
import '../widgets/bellPhoneInput.dart';
import '../widgets/bellButton.dart';
import '../widgets/bellRegistrationFigure.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String phoneInput = '';
  final _userFirstNameController = TextEditingController();
  // final _userLastNameController = TextEditingController();
  final _userPhoneController = TextEditingController();
  // final _userPasswordController = TextEditingController();
  // final _userPasswordConfirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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

                    children: [
                      Container(
                        width: 400,
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(bottom: 30),
                              child: const Text(
                                'ምዝገባ / Registration',
                                style: TextStyle(
                                  color: bellBlue,
                                  fontSize: 21,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            bellInputField(
                                id: _userFirstNameController,
                                type: 'text',
                                hideInputText: false,
                                helpingText: 'ትክክለኛ ስም አስገባ / Provide Valid Name',
                                inputIcon: Icons.account_circle_outlined,
                                inputFontSize: 14,
                                inputHintText: 'ስም / Name'),
                            bellPhoneInput(
                                onPhoneChange: (String phone) {
                                  setState(() {
                                    phoneInput = phone;
                                  });
                                },
                                id: _userPhoneController,
                                errorText:'',
                            ),
                            // bellInputField(
                            //     id: _userPasswordController,
                            //     type: 'password',
                            //     hideInputText: true,
                            //     inputIcon: Icons.error,
                            //     helpingText: 'Provide Your Password',
                            //     inputFontSize: 14,
                            //     inputHintText: 'Add Password'),
                            bellButton(
                              bellButtonText: "መዝግበኝ / Register",
                              bellButtonColor: bellBlue,
                              textSize: 15,
                              bellButtonElevation: 3,
                              callback: () => ({print('good & cool')}),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.bottomLeft,
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                          foregroundColor: bellBlue,
                                          textStyle: const TextStyle(
                                            fontSize: 15,
                                          )),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const LoginScreen()),
                                        );
                                      },
                                      child:
                                          const Text("ለመግባት እዚጋ ይንኩ / To Login Press Here"),
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
}
