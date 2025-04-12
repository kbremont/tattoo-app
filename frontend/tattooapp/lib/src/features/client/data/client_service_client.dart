import 'package:connectrpc/http2.dart';
import 'package:connectrpc/protobuf.dart';
import 'package:connectrpc/protocol/connect.dart' as protocol;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tattooapp/gen/dart/tattooapp/client/v1/client_service.connect.client.dart';

final baseUrl = dotenv.env['CLIENT_SERVICE_BASE_URL'];

class ClientServiceClientFactory {
  static ClientServiceClient create() {
    final transport = protocol.Transport(
      baseUrl: baseUrl!,
      codec: const ProtoCodec(),
      httpClient: createHttpClient(),
    );

    return ClientServiceClient(transport);
  }
}
