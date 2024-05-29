part of '_index.dart';

abstract class Ctrl {
  static HomeCtrl get home => HomeCtrl();
  static SampleSatuCtrl get sampleSatu => SampleSatuCtrl();
  static SampleDuaCtrl get sampleDua => SampleDuaCtrl();
  static SampleTigaCtrl get sampleTiga => SampleTigaCtrl();
  static SignatureCtrl get signature => SignatureCtrl();
  static VerifyCtrl get verify => VerifyCtrl();
  static LoginCtrl get login => LoginCtrl();
  static RegisterCtrl get register => RegisterCtrl();
}
