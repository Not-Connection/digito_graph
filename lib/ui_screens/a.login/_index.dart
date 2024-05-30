import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../app/_index.dart';
import '../../ui_widgets/_index.dart';
import '../../xtras/_index.dart';

part 'a.login.data.dart';
part 'b.login.ctrl.dart';
part 'c.login.view.dart';
part 'widgets/a.login.appbar.dart';
part 'widgets/b.login.fab.dart';
part 'widgets/c.login.email.dart';
part 'widgets/d.login.password.dart';
part 'widgets/e.login.submit.dart';
part 'widgets/f.login.google.dart';
part 'widgets/g.login.anon.dart';
part 'widgets/h.login.to.register.dart';

LoginData get _dt => Data.login.st;
LoginCtrl get _ct => Ctrl.login;
// AuthServ get _svAuth => Serv.auth;
// UserProv get _pv => Prov.user.st;
// UserServ get _sv => Serv.user;
