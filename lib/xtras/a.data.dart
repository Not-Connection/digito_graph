part of '_index.dart';

abstract class Data {
  static Injected<HomeData> get home => _homeData;
  static Injected<SampleSatuData> get sampleSatu => _sampleSatuData;
  static Injected<SampleDuaData> get sampleDua => _sampleDuaData;
  static Injected<SampleTigaData> get sampleTiga => _sampleTigaData;
  static Injected<SignatureData> get signature => _signatureData;
  static Injected<VerifyData> get verify => _verifyData;
  static Injected<LoginData> get login => _loginData;
  static Injected<RegisterData> get register => _registerData;
  static Injected<ProfileData> get profile => _profileData;
}

final _homeData = RM1.inj(HomeData(), Ctrl.home.init);

final _sampleSatuData = RM1.inj(SampleSatuData(), Ctrl.sampleSatu.init);
final _sampleDuaData = RM1.inj(SampleDuaData(), Ctrl.sampleDua.init);
final _sampleTigaData = RM1.inj(SampleTigaData(), Ctrl.sampleTiga.init);

final _signatureData = RM1.inj(SignatureData(), Ctrl.signature.init);

final _verifyData = RM1.inj(VerifyData(), Ctrl.verify.init);

final _loginData = RM1.inj(LoginData(), Ctrl.login.init);
final _registerData = RM1.inj(RegisterData(), Ctrl.register.init);

final _profileData = RM1.inj(ProfileData(), Ctrl.profile.init);
