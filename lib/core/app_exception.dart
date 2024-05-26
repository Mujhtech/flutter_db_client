// ignore_for_file: avoid_equals_and_hash_code_on_mutable_classes

class AppException implements Exception {
  const AppException(this.message);

  final String message;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppException &&
          runtimeType == other.runtimeType &&
          message == other.message;

  @override
  int get hashCode => message.hashCode;

  @override
  String toString() => 'AppException{message: $message}';
}
