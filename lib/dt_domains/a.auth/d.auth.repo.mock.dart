part of '_index.dart';

class AuthRepoMock implements AuthRepo {
  @override
  Future<Auth> postAuth(Map<String, dynamic> login) async {
    return Auth(user: UserX());
  }
}
