// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:connectrpc/http2.dart';
import 'package:connectrpc/protobuf.dart';
import 'package:connectrpc/protocol/connect.dart' as protocol;
// import '../data/user_repository.dart';
import '../../../../gen/dart/tattooapp/v1/user_service.connect.client.dart';

UserServiceClient createUserServiceClient() {

  final transport = protocol.Transport(
    baseUrl: "http://localhost:8000",
    codec: const ProtoCodec(), // Or JsonCodec()
    httpClient: createHttpClient(),
  );

  return UserServiceClient(transport);
}





// Provide the Connect client-based implementation.
// final userRepositoryProvider = Provider<UserRepository>((ref) {
//   // Specify the base URL for your Connect API.
//   // final baseUrl = 'http://localhost:8000/tattooapp.v1.UserService'; // Adjust as needed

//   final transport = protocol.Transport(
//     baseUrl: "http://localhost:8000",
//     codec: const ProtoCodec(), // Or JsonCodec()
//     httpClient: createHttpClient(),
//   );

//   // Instantiate the generated Connect client.
//   final client = UserServiceClient(transport);

//   return UserRepositoryImpl(client: client);
// });
