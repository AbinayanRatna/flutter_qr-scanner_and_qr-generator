import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScannerPage extends StatefulWidget {
  const QrScannerPage({super.key});

  @override
  State<StatefulWidget> createState() => _QrScannerPageState();
}

class _QrScannerPageState extends State<QrScannerPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: "QR");
  QRViewController? controller;
  String result = "Please Scan";

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _onQrViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData.code!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR scan"),
        backgroundColor: Colors.purpleAccent,
        automaticallyImplyLeading: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQrViewCreated,
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text("Scan result: $result",style: TextStyle(
                fontSize: 18,
              ),),
            ),
          ),
        ],
      ),
    );
  }
}
