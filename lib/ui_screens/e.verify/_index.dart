import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:cryptography/cryptography.dart';
import 'package:digito_graph/ui_widgets/spaces/_index.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';
import 'package:pdfx/pdfx.dart';
import 'package:qr_code_dart_scan/qr_code_dart_scan.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../app/_index.dart';
import '../../dt_domains/_index.dart';
import '../../xtras/_index.dart';

part 'a.verify.data.dart';
part 'b.verify.ctrl.dart';
part 'c.verify.view.dart';
part 'widgets/a.verify.appbar.dart';
part 'widgets/b.verify.fab.dart';
part 'widgets/c.verify.charlie.dart';
part 'widgets/d.verify.delta.dart';
part 'widgets/e.verify.echo.dart';

VerifyData get _dt => Data.verify.st;
VerifyCtrl get _ct => Ctrl.verify;
SignatureProv get _pv => Prov.signature.st;
