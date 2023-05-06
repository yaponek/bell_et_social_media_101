/*
 * © 2023 Yared Kassa - LDS. All rights reserved.
 * This code is protected by copyright law and may not be reproduced or distributed without permission.
 */

import 'package:bell_et_social_media_101/constants/coors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProcessDialog {
  static ProcessDialog _instance = new ProcessDialog.internal();
  static bool _isLoading = false;
  ProcessDialog.internal();
  factory ProcessDialog() => _instance;
  // static BuildContext _context;

  static void closeLoadingDialog(BuildContext _context) {
    if (_isLoading) {
      Navigator.of(_context).pop();
      _isLoading = false;
    }
  }

  static void showLoadingDialog(BuildContext _context) async {
    _isLoading = true;
    await showDialog(
        context: _context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const SimpleDialog(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            children: <Widget>[
              Center(
                child: CircularProgressIndicator(
                  valueColor:
                  AlwaysStoppedAnimation<Color>(bellBlue),
                ),
              )
            ],
          );
        });
  }

}