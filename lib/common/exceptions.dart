class DetailsExistException implements Exception {}

class CustomException implements Exception {
  final String message;
  final int code;
  const CustomException(this.message, {this.code = 100});
}

class CancelError implements Exception {
  final String message;
  CancelError(this.message);
}
