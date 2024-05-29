part of '_index.dart';

class Auth {
  final UserX user;
  final String token;
  Auth({
    required this.user,
    this.token = '',
  });

  Auth copyWith({
    UserX? user,
    String? token,
  }) {
    return Auth(
      user: user ?? this.user,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'user': user.toMap()});
    result.addAll({'token': token});

    return result;
  }

  factory Auth.fromMap(Map<String, dynamic> map) {
    return Auth(
      user: UserX.fromMap(map['user']),
      token: map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Auth.fromJson(String source) => Auth.fromMap(json.decode(source));

  @override
  String toString() => 'Auth(user: $user, token: $token)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Auth && other.user == user && other.token == token;
  }

  @override
  int get hashCode => user.hashCode ^ token.hashCode;
}
