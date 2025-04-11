//
//  Generated code. Do not modify.
//  source: tattooapp/client/v1/client_service.proto
//

import "package:connectrpc/connect.dart" as connect;
import "client_service.pb.dart" as tattooappclientv1client_service;
import "client_service.connect.spec.dart" as specs;

extension type ClientServiceClient (connect.Transport _transport) {
  Future<tattooappclientv1client_service.CreateClientProfileResponse> createClientProfile(
    tattooappclientv1client_service.CreateClientProfileRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.ClientService.createClientProfile,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  Future<tattooappclientv1client_service.GetClientProfileResponse> getClientProfile(
    tattooappclientv1client_service.GetClientProfileRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.ClientService.getClientProfile,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  Future<tattooappclientv1client_service.DeleteClientProfileResponse> deleteClientProfile(
    tattooappclientv1client_service.DeleteClientProfileRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.ClientService.deleteClientProfile,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
