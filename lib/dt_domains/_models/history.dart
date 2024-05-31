part of '_index.dart';

class History {
  final String documentPath;
  final String qrBytes;
  History({
    this.documentPath = '',
    this.qrBytes = '',
  });

  History copyWith({
    String? documentPath,
    String? qrBytes,
  }) {
    return History(
      documentPath: documentPath ?? this.documentPath,
      qrBytes: qrBytes ?? this.qrBytes,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'document_path': documentPath});
    result.addAll({'qr_bytes': qrBytes});

    return result;
  }

  factory History.fromMap(Map<String, dynamic> map) {
    return History(
      documentPath: map['document_path'] ?? '',
      qrBytes: map['qr_bytes'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory History.fromJson(String source) => History.fromMap(json.decode(source));

  @override
  String toString() => 'History(documentPath: $documentPath, qrBytes: $qrBytes)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is History && other.documentPath == documentPath && other.qrBytes == qrBytes;
  }

  @override
  int get hashCode => documentPath.hashCode ^ qrBytes.hashCode;
}
