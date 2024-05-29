part of '_index.dart';

class AuthRepo {
  Future<Auth> postAuth(Map<String, dynamic> login) async {
    throw UnimplementedError();
    // try {
    //   final result = await x1HttpDio.post(
    //     ReqX(path: '/users/login', data: login.toMap()),
    //   );
    //   final resultMap = result.data;
    //   final auth = Auth.fromMap(resultMap['data']);
    //   Prov.auth.st.rxAuth.stateAsync = Future.value(auth);
    //   logx.i(auth.token);
    // } catch (e) {
    //   rethrow;
    // }
  }
}
