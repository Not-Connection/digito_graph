import 'dart:convert';
import 'dart:io';
// import 'dart:typed_data';
// import 'dart:typed_data';
// import 'dart:ui';

import 'package:cryptography/cryptography.dart';
import 'package:digito_graph/ui_widgets/spaces/_index.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
// import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image/image.dart' as img;
import 'package:pdfx/pdfx.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:qr_image/qr_image.dart';
import 'package:share_plus/share_plus.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import 'package:syncfusion_flutter_pdf/pdf.dart' as fusion;
// import 'package:uuid/uuid.dart';

import '../../app/_index.dart';
import '../../dt_domains/_index.dart';
import '../../xtras/_index.dart';

part 'a.signature.data.dart';
part 'b.signature.ctrl.dart';
part 'c.signature.view.dart';
part 'widgets/a.signature.appbar.dart';
part 'widgets/b.signature.fab.dart';
part 'widgets/c.signature.bottom_nav_bar.dart';
part 'widgets/d.signature.result.dart';
part 'widgets/e.signature.echo.dart';

SignatureData get _dt => Data.signature.st;
SignatureCtrl get _ct => Ctrl.signature;
SignatureProv get _pv => Prov.signature.st;
