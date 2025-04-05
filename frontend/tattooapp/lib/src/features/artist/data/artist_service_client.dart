import 'package:connectrpc/http2.dart';
import 'package:connectrpc/protobuf.dart';
import 'package:connectrpc/protocol/connect.dart' as protocol;
import 'package:tattooapp/gen/dart/tattooapp/artist/v1/artist_service.connect.client.dart';

class ArtistServiceClientFactory {
  static ArtistServiceClient create() {
    final transport = protocol.Transport(
      // baseUrl: 'http://localhost:9001', // or production URL
      baseUrl: 'https://b2da-136-29-96-96.ngrok-free.app', // or production URL
      // baseUrl: 'https://user-service-xj0e.onrender.com',
      codec: const ProtoCodec(),
      httpClient: createHttpClient(),
    );

    return ArtistServiceClient(transport);
  }
}
