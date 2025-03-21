import 'package:tattooapp/gen/dart/tattooapp/v1/auth_service.connect.client.dart' as proto;
import 'package:connectrpc/http2.dart';
import 'package:connectrpc/protobuf.dart';
import 'package:connectrpc/protocol/connect.dart' as protocol;

class AuthServiceClientFactory {
  proto.AuthServiceClient createClient() {
    final transport = protocol.Transport(
      baseUrl: 'http://localhost:9000',
      codec: const ProtoCodec(),
      httpClient: createHttpClient(),
    );
    return proto.AuthServiceClient(transport);
  }
}
