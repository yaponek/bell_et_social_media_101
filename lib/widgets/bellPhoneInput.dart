/*
 * © 2023 Yared Kassa - LDS. All rights reserved.
 * This code is protected by copyright law and may not be reproduced or distributed without permission.
 */

import 'package:flutter/material.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../constants/coors.dart';

class bellPhoneInput extends StatelessWidget {

  final String? errorText;

  const bellPhoneInput({
    required this.id,
    // this.onCountryChange,
    required this.onPhoneChange,
    this.errorText,
    Key? key,
  }) : super(key: key);

  final   TextEditingController id;
  // late CountryCallback onCountryChange;
  final PhoneCallback onPhoneChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      padding: const EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: IntlPhoneField(
        controller: id,
        keyboardType: TextInputType.number,
        style: const TextStyle(
          fontSize: 14,
        ),
        decoration:  InputDecoration(
          filled: true,
          helperText: 'Type a valid Phone Number',
          suffixIcon: Icon(Icons.phone),
          fillColor: belInputBackground,
          hintText: 'ስልክ ቁጥር / Phone Number',
          errorText: this.errorText,//.isEmpty ? true : "validators": null}),
          // errorText: null,
          hintStyle: TextStyle(
            fontSize: 15,
          ),
          enabledBorder: OutlineInputBorder(
            // width: 0.0 produces a thin "hairline" border
            borderSide: BorderSide(
              width: 4,
              color: belInputBorder,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              width: 4,
              color: belInputBorder,
            ),
          ),
        ),
        initialCountryCode: 'ET',
        onChanged: (phoneData) {
          onPhoneChange(phoneData.completeNumber);
        },
        onCountryChanged: (country) {
          // onCountryChange(country);
        },
      ),
    );
  }
}

typedef CountryCallback = void Function(Country country);
typedef PhoneCallback = void Function(String phone);