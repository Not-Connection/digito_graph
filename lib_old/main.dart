// import 'dart:typed_data';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:cryptography/cryptography.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:qr_flutter/qr_flutter.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Digital Signature',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   File? _selectedFile;
//   File? _signedFile;

//   Future<void> _pickPdfFile() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['pdf'],
//     );

//     if (result != null) {
//       setState(() {
//         _selectedFile = File(result.files.single.path!);
//         _signedFile = null; // Reset signed file if a new file is selected
//       });
//     }
//   }

//   Future<void> _generateSignedPdf() async {
//     if (_selectedFile == null) return;

//     // Generate a key pair
//     final algorithm = Ed25519();
//     final keyPair = await algorithm.newKeyPair();

//     // Read the selected PDF document
//     final pdfBytes = await _selectedFile!.readAsBytes();
//     final signature = await algorithm.sign(
//       pdfBytes,
//       keyPair: keyPair,
//     );

//     // Generate QR code from the signature
//     final qrValidationResult = QrValidator.validate(
//       data: signature.bytes.toString(),
//       version: QrVersions.auto,
//       errorCorrectionLevel: QrErrorCorrectLevel.L,
//     );

//     if (qrValidationResult.status == QrValidationStatus.valid) {
//       final qrCode = qrValidationResult.qrCode;
//       final painter = QrPainter.withQr(
//         qr: qrCode!,
//         color: const Color(0xFF000000),
//         gapless: true,
//       );

//       final directory = await getApplicationDocumentsDirectory();
//       final qrImageFile = File('${directory.path}/qr_code.png');
//       final qrImageBytes = await painter.toImageData(200);
//       await qrImageFile.writeAsBytes(Uint8List.view(qrImageBytes!.buffer));

//       // Add QR code to the PDF document
//       final qrImage = pw.MemoryImage(qrImageBytes.buffer.asUint8List());
//       final pdf = pw.Document();
//       final originalPdf = pw.Context(document: PdfDocument.load(PdfDocumentParserBase().bytes.single));

//       for (var i = 0; i < originalPdf.pagesCount; i++) {
//         final page = originalPdf.getPage(i + 1);
//         final pageImage = await page.render(
//           width: page.width,
//           height: page.height,
//           format: PdfPageFormat.a4,
//         );
//         page.close();

//         pdf.addPage(pw.Page(build: (pw.Context context) {
//           return pw.Stack(
//             children: [
//               pw.FullPage(
//                 ignoreMargins: true,
//                 child: pw.Image(
//                   pw.MemoryImage(pageImage.bytes),
//                   fit: pw.BoxFit.cover,
//                 ),
//               ),
//               pw.Positioned(
//                 left: 450,
//                 top: 750,
//                 child: pw.Image(qrImage, width: 100, height: 100),
//               ),
//             ],
//           );
//         }));
//       }

//       final signedPdfFile = File('${directory.path}/signed_document.pdf');
//       await signedPdfFile.writeAsBytes(await pdf.save());

//       setState(() {
//         _signedFile = signedPdfFile;
//       });

//       // Show success dialog
//       showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//           title: Text('Success'),
//           content: Text('Signed PDF saved at ${signedPdfFile.path}'),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.of(context).pop(),
//               child: Text('OK'),
//             ),
//           ],
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flutter Digital Signature'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: _pickPdfFile,
//               child: Text('Pick PDF File'),
//             ),
//             SizedBox(height: 20),
//             _selectedFile != null
//                 ? Expanded(
//                     child: Container(
//                       height: 300,
//                       child: SfPdfViewer.file(
//                         _selectedFile!,
//                       ),
//                     ),
//                   )
//                 : Text('No PDF selected'),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _generateSignedPdf,
//               child: Text('Generate Signed PDF'),
//             ),
//             SizedBox(height: 20),
//             _signedFile != null
//                 ? Expanded(
//                     child: Container(
//                       height: 300,
//                       child: SfPdfViewer.file(
//                         _signedFile!,
//                       ),
//                     ),
//                   )
//                 : Text('No Signed PDF'),
//           ],
//         ),
//       ),
//     );
//   }
// }





// import 'dart:convert';
// import 'dart:typed_data';

// import 'package:cryptography/cryptography.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final algorithm = Ed25519();
//   Future<SimpleKeyPair> getNewKeyPair() async => await algorithm.newKeyPair();
//   Future<Signature> getSignature(Uint8List bytes) async => await algorithm.sign(
//         bytes,
//         keyPair: await getNewKeyPair(),
//       );

//   Signature? signature;

//   bool? isSignatureCorrect;

//   Future<void> sign(String text) async {
//     final message = text;
//     final messageBytes = utf8.encode(message);
//     final keyPair = await getNewKeyPair();
//     debugPrint('Message: $message');
//     debugPrint('Message Bytes: $messageBytes');
//     debugPrint('KeyPair: $keyPair');
//     debugPrint('Algorithm: $algorithm');
//     signature = await getSignature(messageBytes);
//     setState(() {});
//     debugPrint('$signature');

//     debugPrint('Signature: ${signature!.bytes}');
//     debugPrint('Public Key: ${signature!.publicKey}');
//     debugPrint('EllipticBits: ${signature!.publicKey.type.ellipticBits}');

//     // final isSignatureCorrect = await algorithm.verify(messageBytes, signature: signature);
//     // debugPrint('Correct Signature: $isSignatureCorrect');
//   }

//   Future<void> verify(String text) async {
//     final message = text;
//     final messageBytes = utf8.encode(message);
//     isSignatureCorrect = await algorithm.verify(messageBytes, signature: signature!);
//     setState(() {});
//     debugPrint('Message: $message');
//     debugPrint('Message Bytes: $messageBytes');
//     debugPrint('Signature: ${signature!.bytes}');

//     debugPrint('KeyPair: ${await getNewKeyPair()}');
//     debugPrint('Algorithm: $algorithm');
//     debugPrint('Correct Signature: $isSignatureCorrect');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               onPressed: () async {
//                 debugPrint('*****************************');
//                 await sign('hahaha');
//                 debugPrint('=============================');
//               },
//               child: const Text('Sign'),
//             ),
//             signature == null ? const SizedBox.shrink() : Text('${signature!.publicKey}'),
//             ElevatedButton(
//               onPressed: () async {
//                 debugPrint('*****************************');
//                 await verify('ttt');
//                 debugPrint('=============================');
//               },
//               child: const Text('Verify'),
//             ),
//             isSignatureCorrect == null ? const SizedBox.shrink() : Text('$isSignatureCorrect'),
//           ],
//         ),
//       ),
//     );
//   }
// }
