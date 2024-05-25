enum ResponseType { success, error }

class DataResponse<T> {
  final ResponseType responseType;
  final T? data;
  final ResponseError? error;

  const DataResponse({
    required this.responseType,
    this.data,
    this.error,
  });
}

class ResponseError {
  final String message;

  ResponseError({required this.message});
}
