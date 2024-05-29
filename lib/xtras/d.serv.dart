part of '_index.dart';

abstract class Serv {
  static SampleServ get sample => SampleServ();
  static SignatureServ get signature => SignatureServ();
  static AuthServ get auth => AuthServ();
}
