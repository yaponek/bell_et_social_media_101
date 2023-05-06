/*
 * © 2023 Yared Kassa - LDS. All rights reserved.
 * This code is protected by copyright law and may not be reproduced or distributed without permission.
 */

import 'package:flutter/material.dart';

import '../constants/coors.dart';


class bellInputField extends StatefulWidget {
  // const bellInputField({Key? key}) : super(key: key);
  TextEditingController id;
  String type;
  bool hideInputText;
  String helpingText;
  IconData inputIcon;
  double horizontalMargins;
  double inputFontSize;
  String inputHintText;
  double padding;
  final String? Function(String?)? validator;

  bellInputField({
    required this.id,
    required this.type, //could be 1. password  2. integer  3. text
    required this.hideInputText,
    required this.helpingText,
    required this.inputIcon,
    this.horizontalMargins = 20,
    this.validator,
    this.inputFontSize = 20,
    this.inputHintText = 'input Help Text',
    this.padding = 10,
  });

  @override
  State<bellInputField> createState() => _bellInputFieldState();
}

class _bellInputFieldState extends State<bellInputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: widget.horizontalMargins, vertical: 4),
      padding: const EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        controller: widget.id,
        validator: widget.validator,
        obscureText: widget.hideInputText,
        style: TextStyle(fontSize: widget.inputFontSize ),
        decoration: InputDecoration(
          filled: true,
          enabledBorder: const OutlineInputBorder(
            // width: 0.0 produces a thin "hairline" border
            borderSide: BorderSide(
              width: 4,
              color: belInputBorder,
            ),
          ),
          helperText: widget.helpingText,
          fillColor: belInputBackground,
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 4,
              color: belInputBorder,
            ),
          ),
          contentPadding: EdgeInsets.all(widget.padding),
          suffixIcon: GestureDetector(
            onTap: widget.type == 'password' ? _togglePasswordView: null,
            child: widget.type == 'password'
                ? widget.hideInputText
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility)
                : Icon(widget.inputIcon),
          ),
          prefixIconConstraints: const BoxConstraints(
            maxHeight: 25,
            minWidth: 25,
          ),
          hintText: widget.inputHintText,
          hintStyle: const TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      widget.hideInputText = !widget.hideInputText;
    });
  }
}
