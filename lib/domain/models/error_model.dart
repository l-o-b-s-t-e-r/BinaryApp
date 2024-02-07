sealed class ErrorModel {}

sealed class ApiError extends ErrorModel {}

sealed class IOError extends ErrorModel {}

class Network extends ApiError {}

class ServiceUnavailable extends ApiError {}

class Unknown extends ApiError {}
