import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:flutter/material.dart';

class QRCodeScanScreen extends StatelessWidget {
  const QRCodeScanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AiBarcodeScanner(
        onScan: (String value) {
          // todo: handle the scanned value
        },
        onDetect: (BarcodeCapture barcodeCapture) {},
      ),
    );
  }
}
