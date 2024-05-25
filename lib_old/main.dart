import 'dart:convert';
import 'dart:typed_data';

import 'package:cryptography/cryptography.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final algorithm = Ed25519();
  Future<SimpleKeyPair> getNewKeyPair() async => await algorithm.newKeyPair();
  Future<Signature> getSignature(Uint8List bytes) async => await algorithm.sign(
        bytes,
        keyPair: await getNewKeyPair(),
      );

  Signature? signature;

  bool? isSignatureCorrect;

  Future<void> sign(String text) async {
    final message = text;
    final messageBytes = utf8.encode(message);
    final keyPair = await getNewKeyPair();
    debugPrint('Message: $message');
    debugPrint('Message Bytes: $messageBytes');
    debugPrint('KeyPair: $keyPair');
    debugPrint('Algorithm: $algorithm');
    signature = await getSignature(messageBytes);
    setState(() {});
    debugPrint('$signature');

    debugPrint('Signature: ${signature!.bytes}');
    debugPrint('Public Key: ${signature!.publicKey}');
    debugPrint('EllipticBits: ${signature!.publicKey.type.ellipticBits}');

    // final isSignatureCorrect = await algorithm.verify(messageBytes, signature: signature);
    // debugPrint('Correct Signature: $isSignatureCorrect');
  }

  Future<void> verify(String text) async {
    final message = text;
    final messageBytes = utf8.encode(message);
    isSignatureCorrect = await algorithm.verify(messageBytes, signature: signature!);
    setState(() {});
    debugPrint('Message: $message');
    debugPrint('Message Bytes: $messageBytes');
    debugPrint('Signature: ${signature!.bytes}');

    debugPrint('KeyPair: ${await getNewKeyPair()}');
    debugPrint('Algorithm: $algorithm');
    debugPrint('Correct Signature: $isSignatureCorrect');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                debugPrint('*****************************');
                await sign('hahaha');
                debugPrint('=============================');
              },
              child: const Text('Sign'),
            ),
            signature == null ? const SizedBox.shrink() : Text('${signature!.publicKey}'),
            ElevatedButton(
              onPressed: () async {
                debugPrint('*****************************');
                await verify('ttt');
                debugPrint('=============================');
              },
              child: const Text('Verify'),
            ),
            isSignatureCorrect == null ? const SizedBox.shrink() : Text('$isSignatureCorrect'),
          ],
        ),
      ),
    );
  }
}
