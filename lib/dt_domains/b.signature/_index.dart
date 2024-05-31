import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:states_rebuilder/states_rebuilder.dart';

import '../../app/_index.dart';
import '../../xtras/_index.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

import '../_models/_index.dart';

part 'a.signature.prov.dart';
part 'b.signature.serv.dart';
part 'c.signature.repo.dart';
part 'd.signature.repo.mock.dart';

SignatureProv get _pv => Prov.signature.st;
SignatureServ get _sv => Serv.signature;
SignatureRepo get _rp => Repo.signature.st;
