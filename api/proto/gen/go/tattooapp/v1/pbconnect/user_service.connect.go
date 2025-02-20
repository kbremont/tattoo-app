// Code generated by protoc-gen-connect-go. DO NOT EDIT.
//
// Source: tattooapp/v1/user_service.proto

package pbconnect

import (
	connect "connectrpc.com/connect"
	context "context"
	errors "errors"
	v1 "github.com/kbremont/tattoo-app/api/proto/gen/go/tattooapp/v1"
	http "net/http"
	strings "strings"
)

// This is a compile-time assertion to ensure that this generated file and the connect package are
// compatible. If you get a compiler error that this constant is not defined, this code was
// generated with a version of connect newer than the one compiled into your binary. You can fix the
// problem by either regenerating this code with an older version of connect or updating the connect
// version compiled into your binary.
const _ = connect.IsAtLeastVersion1_13_0

const (
	// UserServiceName is the fully-qualified name of the UserService service.
	UserServiceName = "tattooapp.v1.UserService"
)

// These constants are the fully-qualified names of the RPCs defined in this package. They're
// exposed at runtime as Spec.Procedure and as the final two segments of the HTTP route.
//
// Note that these are different from the fully-qualified method names used by
// google.golang.org/protobuf/reflect/protoreflect. To convert from these constants to
// reflection-formatted method names, remove the leading slash and convert the remaining slash to a
// period.
const (
	// UserServiceCreateUserProcedure is the fully-qualified name of the UserService's CreateUser RPC.
	UserServiceCreateUserProcedure = "/tattooapp.v1.UserService/CreateUser"
	// UserServiceGetUserProcedure is the fully-qualified name of the UserService's GetUser RPC.
	UserServiceGetUserProcedure = "/tattooapp.v1.UserService/GetUser"
	// UserServiceUpdateUserProcedure is the fully-qualified name of the UserService's UpdateUser RPC.
	UserServiceUpdateUserProcedure = "/tattooapp.v1.UserService/UpdateUser"
	// UserServiceDeleteUserProcedure is the fully-qualified name of the UserService's DeleteUser RPC.
	UserServiceDeleteUserProcedure = "/tattooapp.v1.UserService/DeleteUser"
)

// UserServiceClient is a client for the tattooapp.v1.UserService service.
type UserServiceClient interface {
	CreateUser(context.Context, *connect.Request[v1.CreateUserRequest]) (*connect.Response[v1.CreateUserResponse], error)
	GetUser(context.Context, *connect.Request[v1.GetUserRequest]) (*connect.Response[v1.GetUserResponse], error)
	UpdateUser(context.Context, *connect.Request[v1.UpdateUserRequest]) (*connect.Response[v1.UpdateUserResponse], error)
	DeleteUser(context.Context, *connect.Request[v1.DeleteUserRequest]) (*connect.Response[v1.DeleteUserResponse], error)
}

// NewUserServiceClient constructs a client for the tattooapp.v1.UserService service. By default, it
// uses the Connect protocol with the binary Protobuf Codec, asks for gzipped responses, and sends
// uncompressed requests. To use the gRPC or gRPC-Web protocols, supply the connect.WithGRPC() or
// connect.WithGRPCWeb() options.
//
// The URL supplied here should be the base URL for the Connect or gRPC server (for example,
// http://api.acme.com or https://acme.com/grpc).
func NewUserServiceClient(httpClient connect.HTTPClient, baseURL string, opts ...connect.ClientOption) UserServiceClient {
	baseURL = strings.TrimRight(baseURL, "/")
	userServiceMethods := v1.File_tattooapp_v1_user_service_proto.Services().ByName("UserService").Methods()
	return &userServiceClient{
		createUser: connect.NewClient[v1.CreateUserRequest, v1.CreateUserResponse](
			httpClient,
			baseURL+UserServiceCreateUserProcedure,
			connect.WithSchema(userServiceMethods.ByName("CreateUser")),
			connect.WithClientOptions(opts...),
		),
		getUser: connect.NewClient[v1.GetUserRequest, v1.GetUserResponse](
			httpClient,
			baseURL+UserServiceGetUserProcedure,
			connect.WithSchema(userServiceMethods.ByName("GetUser")),
			connect.WithClientOptions(opts...),
		),
		updateUser: connect.NewClient[v1.UpdateUserRequest, v1.UpdateUserResponse](
			httpClient,
			baseURL+UserServiceUpdateUserProcedure,
			connect.WithSchema(userServiceMethods.ByName("UpdateUser")),
			connect.WithClientOptions(opts...),
		),
		deleteUser: connect.NewClient[v1.DeleteUserRequest, v1.DeleteUserResponse](
			httpClient,
			baseURL+UserServiceDeleteUserProcedure,
			connect.WithSchema(userServiceMethods.ByName("DeleteUser")),
			connect.WithClientOptions(opts...),
		),
	}
}

// userServiceClient implements UserServiceClient.
type userServiceClient struct {
	createUser *connect.Client[v1.CreateUserRequest, v1.CreateUserResponse]
	getUser    *connect.Client[v1.GetUserRequest, v1.GetUserResponse]
	updateUser *connect.Client[v1.UpdateUserRequest, v1.UpdateUserResponse]
	deleteUser *connect.Client[v1.DeleteUserRequest, v1.DeleteUserResponse]
}

// CreateUser calls tattooapp.v1.UserService.CreateUser.
func (c *userServiceClient) CreateUser(ctx context.Context, req *connect.Request[v1.CreateUserRequest]) (*connect.Response[v1.CreateUserResponse], error) {
	return c.createUser.CallUnary(ctx, req)
}

// GetUser calls tattooapp.v1.UserService.GetUser.
func (c *userServiceClient) GetUser(ctx context.Context, req *connect.Request[v1.GetUserRequest]) (*connect.Response[v1.GetUserResponse], error) {
	return c.getUser.CallUnary(ctx, req)
}

// UpdateUser calls tattooapp.v1.UserService.UpdateUser.
func (c *userServiceClient) UpdateUser(ctx context.Context, req *connect.Request[v1.UpdateUserRequest]) (*connect.Response[v1.UpdateUserResponse], error) {
	return c.updateUser.CallUnary(ctx, req)
}

// DeleteUser calls tattooapp.v1.UserService.DeleteUser.
func (c *userServiceClient) DeleteUser(ctx context.Context, req *connect.Request[v1.DeleteUserRequest]) (*connect.Response[v1.DeleteUserResponse], error) {
	return c.deleteUser.CallUnary(ctx, req)
}

// UserServiceHandler is an implementation of the tattooapp.v1.UserService service.
type UserServiceHandler interface {
	CreateUser(context.Context, *connect.Request[v1.CreateUserRequest]) (*connect.Response[v1.CreateUserResponse], error)
	GetUser(context.Context, *connect.Request[v1.GetUserRequest]) (*connect.Response[v1.GetUserResponse], error)
	UpdateUser(context.Context, *connect.Request[v1.UpdateUserRequest]) (*connect.Response[v1.UpdateUserResponse], error)
	DeleteUser(context.Context, *connect.Request[v1.DeleteUserRequest]) (*connect.Response[v1.DeleteUserResponse], error)
}

// NewUserServiceHandler builds an HTTP handler from the service implementation. It returns the path
// on which to mount the handler and the handler itself.
//
// By default, handlers support the Connect, gRPC, and gRPC-Web protocols with the binary Protobuf
// and JSON codecs. They also support gzip compression.
func NewUserServiceHandler(svc UserServiceHandler, opts ...connect.HandlerOption) (string, http.Handler) {
	userServiceMethods := v1.File_tattooapp_v1_user_service_proto.Services().ByName("UserService").Methods()
	userServiceCreateUserHandler := connect.NewUnaryHandler(
		UserServiceCreateUserProcedure,
		svc.CreateUser,
		connect.WithSchema(userServiceMethods.ByName("CreateUser")),
		connect.WithHandlerOptions(opts...),
	)
	userServiceGetUserHandler := connect.NewUnaryHandler(
		UserServiceGetUserProcedure,
		svc.GetUser,
		connect.WithSchema(userServiceMethods.ByName("GetUser")),
		connect.WithHandlerOptions(opts...),
	)
	userServiceUpdateUserHandler := connect.NewUnaryHandler(
		UserServiceUpdateUserProcedure,
		svc.UpdateUser,
		connect.WithSchema(userServiceMethods.ByName("UpdateUser")),
		connect.WithHandlerOptions(opts...),
	)
	userServiceDeleteUserHandler := connect.NewUnaryHandler(
		UserServiceDeleteUserProcedure,
		svc.DeleteUser,
		connect.WithSchema(userServiceMethods.ByName("DeleteUser")),
		connect.WithHandlerOptions(opts...),
	)
	return "/tattooapp.v1.UserService/", http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		switch r.URL.Path {
		case UserServiceCreateUserProcedure:
			userServiceCreateUserHandler.ServeHTTP(w, r)
		case UserServiceGetUserProcedure:
			userServiceGetUserHandler.ServeHTTP(w, r)
		case UserServiceUpdateUserProcedure:
			userServiceUpdateUserHandler.ServeHTTP(w, r)
		case UserServiceDeleteUserProcedure:
			userServiceDeleteUserHandler.ServeHTTP(w, r)
		default:
			http.NotFound(w, r)
		}
	})
}

// UnimplementedUserServiceHandler returns CodeUnimplemented from all methods.
type UnimplementedUserServiceHandler struct{}

func (UnimplementedUserServiceHandler) CreateUser(context.Context, *connect.Request[v1.CreateUserRequest]) (*connect.Response[v1.CreateUserResponse], error) {
	return nil, connect.NewError(connect.CodeUnimplemented, errors.New("tattooapp.v1.UserService.CreateUser is not implemented"))
}

func (UnimplementedUserServiceHandler) GetUser(context.Context, *connect.Request[v1.GetUserRequest]) (*connect.Response[v1.GetUserResponse], error) {
	return nil, connect.NewError(connect.CodeUnimplemented, errors.New("tattooapp.v1.UserService.GetUser is not implemented"))
}

func (UnimplementedUserServiceHandler) UpdateUser(context.Context, *connect.Request[v1.UpdateUserRequest]) (*connect.Response[v1.UpdateUserResponse], error) {
	return nil, connect.NewError(connect.CodeUnimplemented, errors.New("tattooapp.v1.UserService.UpdateUser is not implemented"))
}

func (UnimplementedUserServiceHandler) DeleteUser(context.Context, *connect.Request[v1.DeleteUserRequest]) (*connect.Response[v1.DeleteUserResponse], error) {
	return nil, connect.NewError(connect.CodeUnimplemented, errors.New("tattooapp.v1.UserService.DeleteUser is not implemented"))
}
