import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

class qrPage extends StatefulWidget {
  const qrPage({Key? key}) : super(key: key);

  @override
  State<qrPage> createState() => _qrPageState();
}

class _qrPageState extends State<qrPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  @override
  void reassemble() {
    var platform = Theme.of(context).platform;
    super.reassemble();
    if (platform == TargetPlatform.android) {
      controller!.pauseCamera();
    } else if (platform == TargetPlatform.iOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              formatsAllowed: [BarcodeFormat.qrcode],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (result != null)
                  Text('Contenido del QR: ${result!.code}'),
                SizedBox(height: 16),
                if (result?.code != null)
                  ElevatedButton(
                    onPressed: () {
                      final String url = result!.code!;
                      final Uri uri = Uri.parse(url);
                      //_openUrl(uri);
                      _launchUrl(uri);
                    },
                    child: Text('Abrir URL'),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });

      // Imprime la URL en la consola para verificar.
      print('URL del código QR: ${result?.code}');
    });
  }

  void _openUrl(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      // Mensaje si no se puede abrir la URL.
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('No se pudo abrir la URL.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
  Future<void> _launchUrl(_url) async {
    if (!await launchUrl(_url)) {
      //throw Exception('Could not launch $_url');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('No se pudo abrir la URL.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
