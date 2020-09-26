class DetailsExistException implements Exception {}

class CustomException implements Exception {
  final String message;
  const CustomException(this.message);
}
