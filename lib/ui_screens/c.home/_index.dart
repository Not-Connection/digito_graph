import 'dart:math';

import 'package:digito_graph/ui_widgets/spaces/_index.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../app/_index.dart';
import '../../xtras/_index.dart';

part 'a.home.data.dart';
part 'b.home.ctrl.dart';
part 'c.home.view.dart';
part 'widgets/a.home.appbar.dart';
part 'widgets/b.home.info.dart';
part 'widgets/c.home.buttons.dart';
part 'widgets/d.home.feat_button.dart';
part 'widgets/e.home.recent_activities.dart';

HomeData get _dt => Data.home.st;
HomeCtrl get _ct => Ctrl.home;
