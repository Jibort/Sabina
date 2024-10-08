class QRScannerHome {

}
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:ld_learn/09_tools/theme.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';


// class QRScannerHome extends StatefulWidget {
//   const QRScannerHome({super.key});

//   @override
//   State<QRScannerHome> createState() => _QRScannerHomeState();
// }

// class _QRScannerHomeState extends State<QRScannerHome> {
//   QRViewController? controller;
//   Barcode? result;

//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

//   @override
//   void reassemble() {
//     if (Platform.isAndroid) {
//       controller!.pauseCamera();
//     }
//     controller!.resumeCamera();
//     super.reassemble();
//   }

//   @override
//   void dispose() {
//     controller!.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue[60],
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(
//             Icons.chevron_left,
//             size: 25,
//             color: scaffoldBgColor,
//           ),
//         ),
//         title: const Text(
//           "Scanned QR",
//           style: TextStyle(color: scaffoldBgColor, fontSize: 16),
//         ),
//       ),
//       body: Container(
//         height: MediaQuery.of(context).size.height,
//         decoration:
//             const BoxDecoration(gradient: LinearGradient(colors: [Colors.green, Colors.orange])),
//         child: Stack(
//           children: [
//             QRView(
//               key: qrKey,
//               onQRViewCreated: _onQRViewCreated,
//               overlay: QrScannerOverlayShape(
//                   borderColor: scaffoldBgColor,
//                   borderRadius: 5,
//                   borderLength: 20,
//                   borderWidth: 5,
//                   cutOutSize: 250.sp),
//               onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _onQRViewCreated(QRViewController controller) {
//     setState(() {
//       this.controller = controller;
//     });
//     controller.scannedDataStream.listen((scanData) {
//       if (scanData.format == BarcodeFormat.qrcode && scanData.code!.isNotEmpty) {
//         controller.pauseCamera();
//         navigateToNextScreen(scanData.code.toString());
//       }
//     });
//   }

//   void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
//     if (!p) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('no Permission')),
//       );
//     }
//   }

//   void navigateToNextScreen(String qrData) {
//     // Navigator.push(
//     //   context,
//     //   MaterialPageRoute(
//     //     builder: (context) => QRResult(
//     //       scanData: qrData,
//     //     ),
//     //   ),
//     // );
//   }
// }
