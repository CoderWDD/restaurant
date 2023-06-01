import 'dart:convert';

import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/entities/canteen.dart';

import '../../constants/router_constants.dart';
import '../../go_router_data.dart';
import '../../routers.dart';

class QRCodeScanScreen extends StatelessWidget {
  const QRCodeScanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late Canteen res;
    return SafeArea(
      child: AiBarcodeScanner(
        onScan: (String value) {
          // handle the scanned value
          res =  Canteen.fromJson(jsonDecode(value));
          if (res.id != -1) {
            routers.push(RESTAURANT_SCREEN, extra: GoRouterData(query: res.toJson()));
          }
        },
        onDispose: () {
          // when the scanner view is closed
          routers.push(RESTAURANT_SCREEN, extra: GoRouterData(query: res.toJson()));
        },
        onDetect: (BarcodeCapture barcodeCapture) {
        },
      ),
    );
  }
}
