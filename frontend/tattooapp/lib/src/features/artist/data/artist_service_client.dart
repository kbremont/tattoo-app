import 'package:connectrpc/http2.dart';
import 'package:connectrpc/protobuf.dart';
import 'package:connectrpc/protocol/connect.dart' as protocol;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tattooapp/gen/dart/tattooapp/artist/v1/artist_service.connect.client.dart';

final baseUrl = dotenv.env['ARTIST_SERVICE_BASE_URL'];

class ArtistServiceClientFactory {
  static ArtistServiceClient create() {
    final transport = protocol.Transport(
      baseUrl: baseUrl!, // or production URL
      // baseUrl: 'https://user-service-xj0e.onrender.com',
      codec: const ProtoCodec(),
      httpClient: createHttpClient(),
    );

    return ArtistServiceClient(transport);
  }
}
