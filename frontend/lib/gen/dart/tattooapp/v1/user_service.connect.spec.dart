//
//  Generated code. Do not modify.
//  source: tattooapp/v1/user_service.proto
//

import "package:connectrpc/connect.dart" as connect;
import "user_service.pb.dart" as tattooappv1user_service;

abstract final class UserService {
  /// Fully-qualified name of the UserService service.
  static const name = 'tattooapp.v1.UserService';

  static const createUser = connect.Spec(
    '/$name/CreateUser',
    connect.StreamType.unary,
    tattooappv1user_service.CreateUserRequest.new,
    tattooappv1user_service.CreateUserResponse.new,
  );

  static const getUser = connect.Spec(
    '/$name/GetUser',
    connect.StreamType.unary,
    tattooappv1user_service.GetUserRequest.new,
    tattooappv1user_service.GetUserResponse.new,
  );

  static const updateUser = connect.Spec(
    '/$name/UpdateUser',
    connect.StreamType.unary,
    tattooappv1user_service.UpdateUserRequest.new,
    tattooappv1user_service.UpdateUserResponse.new,
  );

  static const deleteUser = connect.Spec(
    '/$name/DeleteUser',
    connect.StreamType.unary,
    tattooappv1user_service.DeleteUserRequest.new,
    tattooappv1user_service.DeleteUserResponse.new,
  );
}
