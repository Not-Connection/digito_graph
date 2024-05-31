part of '_index.dart';

class PersonalInfo {
  final String id;
  final String name;
  final String email;
  final String lastModified;
  final String signatureBase64;
  final String publicKeyBase64;
  PersonalInfo({
    this.id = '',
    this.name = '',
    this.email = '',
    this.lastModified = '',
    this.signatureBase64 = '',
    this.publicKeyBase64 = '',
  });

  PersonalInfo copyWith({
    String? id,
    String? name,
    String? email,
    String? lastModified,
    String? signatureBase64,
    String? publicKeyBase64,
  }) {
    return PersonalInfo(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      lastModified: lastModified ?? this.lastModified,
      signatureBase64: signatureBase64 ?? this.signatureBase64,
      publicKeyBase64: publicKeyBase64 ?? this.publicKeyBase64,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'email': email});
    result.addAll({'last_modified': lastModified});
    result.addAll({'signature_base64': signatureBase64});
    result.addAll({'public_key_base64': publicKeyBase64});

    return result;
  }

  factory PersonalInfo.fromMap(Map<String, dynamic> map) {
    return PersonalInfo(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      lastModified: map['last_modified'] ?? '',
      signatureBase64: map['signature_base64'] ?? '',
      publicKeyBase64: map['public_key_base64'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PersonalInfo.fromJson(String source) => PersonalInfo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PersonalInfo(id: $id, name: $name, email: $email, lastModified: $lastModified, signatureBase64: $signatureBase64, publicKeyBase64: $publicKeyBase64)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PersonalInfo &&
        other.id == id &&
        other.name == name &&
        other.email == email &&
        other.lastModified == lastModified &&
        other.signatureBase64 == signatureBase64 &&
        other.publicKeyBase64 == publicKeyBase64;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        lastModified.hashCode ^
        signatureBase64.hashCode ^
        publicKeyBase64.hashCode;
  }
}
