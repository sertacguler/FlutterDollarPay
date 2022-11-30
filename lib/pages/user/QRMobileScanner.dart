import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:dollar_pay/components/QR_Scanner/qr_overlay.dart';

class QRMobileScanner extends StatelessWidget {
  const QRMobileScanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late String rawValue;

    return Scaffold(
      body: Stack(
        children: [
          MobileScanner(
              allowDuplicates: false,
              controller: MobileScannerController(),
              onDetect: (barcode, args) {
                if (barcode.rawValue == null) {
                  print('Failed to scan Barcode');
                } else {
                  rawValue = barcode.rawValue!;
                  if (rawValue.contains('dollarpay')) {
                    print('value rawValue : $rawValue');
                    Navigator.pop(context, rawValue);
                  } else {
                    print('not our qr -> value rawValue : $rawValue');
                  }
                }
              }),
          QRScannerOverlay(overlayColour: Colors.black.withOpacity(0.5)),
        ],
      ),
    );
  }
}
