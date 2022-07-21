import 'package:dio/dio.dart';

class HTTPInterceptor extends InterceptorsWrapper {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print(err);
    return super.onError(err, handler);
  }
}

class HTTP {
  late Dio client;
  HTTP() {
    client = Dio(BaseOptions(
      //TODO: replace with real backend url
      baseUrl: 'backendUrl',
      receiveDataWhenStatusError: true,
      contentType: 'application/json',
      validateStatus: (status) => status! < 400,
    ));
    client.interceptors.add(
      HTTPInterceptor(),
    );
  }
}

final http = HTTP();
