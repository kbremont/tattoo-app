import 'package:connectrpc/http2.dart';
import 'package:connectrpc/protobuf.dart';
import 'package:connectrpc/protocol/connect.dart' as protocol;
import 'package:tattooapp/gen/dart/tattooapp/user/v1/user_service.connect.client.dart';

class UserServiceClientFactory {
  static UserServiceClient create() {
    final transport = protocol.Transport(
      // baseUrl: 'http://localhost:9001', // or production URL
      baseUrl: 'https://bf7f-136-29-96-96.ngrok-free.app', // or production URL
      // baseUrl: 'https://user-service-xj0e.onrender.com',
      codec: const ProtoCodec(),
      httpClient: createHttpClient(),
    );

    return UserServiceClient(transport);
  }
}
