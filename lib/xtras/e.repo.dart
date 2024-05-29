part of '_index.dart';

abstract class Repo {
  static Injected<SampleRepo> get sample => _sampleRepo;
  static Injected<SignatureRepo> get signature => _signatureRepo;
  static Injected<AuthRepo> get auth => _authRepo;
}

final _sampleRepo = RM3.inj(SampleRepo());

final _signatureRepo = RM3.inj(SignatureRepo());

final _authRepo = RM3.inj(AuthRepo());
