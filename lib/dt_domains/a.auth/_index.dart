import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:states_rebuilder/scr/state_management/rm.dart';

import '../../app/_index.dart';
import '../../dt_sources/_index.dart';
import '../../xtras/_index.dart';
import '../_models/_index.dart';

part 'a.auth.prov.dart';
part 'b.auth.serv.dart';
part 'c.auth.repo.dart';
part 'd.auth.repo.mock.dart';

AuthProv get _pv => Prov.auth.st;
