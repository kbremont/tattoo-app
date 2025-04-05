import 'package:connectrpc/http2.dart';
import 'package:connectrpc/protobuf.dart';
import 'package:connectrpc/protocol/connect.dart' as protocol;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tattooapp/gen/dart/tattooapp/user/v1/user_service.connect.client.dart';

final baseUrl = dotenv.env['USER_SERVICE_BASE_URL'];

class UserServiceClientFactory {
  static UserServiceClient create() {
    final transport = protocol.Transport(
      baseUrl: baseUrl!, // or production URL
      // baseUrl: 'https://user-service-xj0e.onrender.com',
      codec: const ProtoCodec(),
      httpClient: createHttpClient(),
    );

    return UserServiceClient(transport);
  }
}
