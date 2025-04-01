import 'package:connectrpc/connect.dart';

Headers authHeaders(String accessToken) {
  return Headers()..['Authorization'] = 'Bearer $accessToken';
}
