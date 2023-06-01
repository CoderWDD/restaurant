import 'dart:convert';

import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/entities/QRResEntity.dart';

class QRCodeScanScreen extends StatelessWidget {
  const QRCodeScanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AiBarcodeScanner(
        onScan: (String value) {
          // handle the scanned value
          QRResEntity res = QRResEntity.fromJson(jsonDecode(value));
          if (res.canteenId != -1) {
            Navigator.pushNamed(context, '/canteen', arguments: res);
          } else {
            Navigator.pushNamed(context, '/restaurant', arguments: res);
          }
        },
        onDetect: (BarcodeCapture barcodeCapture) {},
      ),
    );
  }
}
