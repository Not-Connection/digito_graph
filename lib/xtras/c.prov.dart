part of '_index.dart';

abstract class Prov {
  static Injected<SampleProv> get sample => _sampleProv;
  static Injected<SignatureProv> get signature => _signatureProv;
  static Injected<AuthProv> get auth => _authProv;
}

final _sampleProv = RM2.inj(SampleProv());

final _signatureProv = RM2.inj(SignatureProv());

final _authProv = RM2.inj(AuthProv());
