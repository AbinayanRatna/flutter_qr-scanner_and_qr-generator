import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_new/qrScan.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<StatefulWidget> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter + QR code'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Enter your URL'),
            ),
          ),
          //This button when pressed navigates to QR code generation
          ElevatedButton(
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) {
                      return QRImage(controller);
                    }),
                  ),
                );
              },
              child: const Text('GENERATE QR CODE')),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => QrScannerPage()));
              },
              child: const Text('Scan qr'))
        ],
      ),
    );
  }
}

class QRImage extends StatelessWidget {
  const QRImage(this.controller, {super.key});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter + QR code'),
          centerTitle: true,
        ),
        body: Center(
          child: QrImageView(
            data: controller.text,
            size: 280,
            //You can use include embeddedImageStyle Property if you wanna embed an image from your Asset folder
            embeddedImageStyle: const QrEmbeddedImageStyle(
              size: Size(
                100,
                100,
              ),
            ),
          ),
        ));
  }
}
