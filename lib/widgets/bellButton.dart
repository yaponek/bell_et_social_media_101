/*
 * © 2023 Yared Kassa - LDS. All rights reserved.
 * This code is protected by copyright law and may not be reproduced or distributed without permission.
 */

import 'package:flutter/material.dart';
import '../constants/coors.dart';

class bellButton extends StatelessWidget {

  Color bellButtonColor;
  String bellButtonText;
  double textSize, bellButtonElevation;
  VoidCallback callback;

  bellButton({
    required this.bellButtonText,
    required this.bellButtonColor,
    required this.textSize,
    required this.bellButtonElevation,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      padding: const EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: bellButtonColor,
            elevation: bellButtonElevation,
            padding: const EdgeInsets.all(18)),
        onPressed: callback,
        child: Text( bellButtonText,
            style: TextStyle(
              fontSize: textSize,
            )),
      ),
    );
  }

  go() {
    print('bell Button Text');
  }
}
