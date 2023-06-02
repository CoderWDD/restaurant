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
        validator: (String value) {
          res = Canteen.fromJson(jsonDecode(value));
          return res.id != -1;
        },
        onScan: (String value) {
          Future.delayed(
            Duration.zero,
            () {
              routers.push(RESTAURANT_SCREEN,
                  extra: GoRouterData(query: res.toJson()));
              //your code goes here
            },
          );
          // handle the scanned value
        },
        onDispose: () {
          // when the scanner view is closed
          // routers.push(RESTAURANT_SCREEN, extra: GoRouterData(query: res.toJson()));
        },
        onDetect: (BarcodeCapture barcodeCapture) {},
      ),
    );
  }
}
