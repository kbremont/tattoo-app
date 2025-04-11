//
//  Generated code. Do not modify.
//  source: tattooapp/client/v1/client_service.proto
//

import "package:connectrpc/connect.dart" as connect;
import "client_service.pb.dart" as tattooappclientv1client_service;

abstract final class ClientService {
  /// Fully-qualified name of the ClientService service.
  static const name = 'tattooapp.client.v1.ClientService';

  static const createClientProfile = connect.Spec(
    '/$name/CreateClientProfile',
    connect.StreamType.unary,
    tattooappclientv1client_service.CreateClientProfileRequest.new,
    tattooappclientv1client_service.CreateClientProfileResponse.new,
  );

  static const getClientProfile = connect.Spec(
    '/$name/GetClientProfile',
    connect.StreamType.unary,
    tattooappclientv1client_service.GetClientProfileRequest.new,
    tattooappclientv1client_service.GetClientProfileResponse.new,
  );

  static const deleteClientProfile = connect.Spec(
    '/$name/DeleteClientProfile',
    connect.StreamType.unary,
    tattooappclientv1client_service.DeleteClientProfileRequest.new,
    tattooappclientv1client_service.DeleteClientProfileResponse.new,
  );
}
