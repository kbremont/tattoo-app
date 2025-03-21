// Code generated by protoc-gen-connect-go. DO NOT EDIT.
//
// Source: tattooapp/v1/auth_service.proto

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
	// AuthServiceName is the fully-qualified name of the AuthService service.
	AuthServiceName = "tattooapp.v1.AuthService"
)

// These constants are the fully-qualified names of the RPCs defined in this package. They're
// exposed at runtime as Spec.Procedure and as the final two segments of the HTTP route.
//
// Note that these are different from the fully-qualified method names used by
// google.golang.org/protobuf/reflect/protoreflect. To convert from these constants to
// reflection-formatted method names, remove the leading slash and convert the remaining slash to a
// period.
const (
	// AuthServiceSignUpProcedure is the fully-qualified name of the AuthService's SignUp RPC.
	AuthServiceSignUpProcedure = "/tattooapp.v1.AuthService/SignUp"
	// AuthServiceLogInProcedure is the fully-qualified name of the AuthService's LogIn RPC.
	AuthServiceLogInProcedure = "/tattooapp.v1.AuthService/LogIn"
	// AuthServiceRefreshTokenProcedure is the fully-qualified name of the AuthService's RefreshToken
	// RPC.
	AuthServiceRefreshTokenProcedure = "/tattooapp.v1.AuthService/RefreshToken"
	// AuthServiceLogOutProcedure is the fully-qualified name of the AuthService's LogOut RPC.
	AuthServiceLogOutProcedure = "/tattooapp.v1.AuthService/LogOut"
)

// AuthServiceClient is a client for the tattooapp.v1.AuthService service.
type AuthServiceClient interface {
	SignUp(context.Context, *connect.Request[v1.SignUpRequest]) (*connect.Response[v1.SignUpResponse], error)
	LogIn(context.Context, *connect.Request[v1.LogInRequest]) (*connect.Response[v1.LogInResponse], error)
	RefreshToken(context.Context, *connect.Request[v1.RefreshTokenRequest]) (*connect.Response[v1.RefreshTokenResponse], error)
	LogOut(context.Context, *connect.Request[v1.LogOutRequest]) (*connect.Response[v1.LogOutResponse], error)
}

// NewAuthServiceClient constructs a client for the tattooapp.v1.AuthService service. By default, it
// uses the Connect protocol with the binary Protobuf Codec, asks for gzipped responses, and sends
// uncompressed requests. To use the gRPC or gRPC-Web protocols, supply the connect.WithGRPC() or
// connect.WithGRPCWeb() options.
//
// The URL supplied here should be the base URL for the Connect or gRPC server (for example,
// http://api.acme.com or https://acme.com/grpc).
func NewAuthServiceClient(httpClient connect.HTTPClient, baseURL string, opts ...connect.ClientOption) AuthServiceClient {
	baseURL = strings.TrimRight(baseURL, "/")
	authServiceMethods := v1.File_tattooapp_v1_auth_service_proto.Services().ByName("AuthService").Methods()
	return &authServiceClient{
		signUp: connect.NewClient[v1.SignUpRequest, v1.SignUpResponse](
			httpClient,
			baseURL+AuthServiceSignUpProcedure,
			connect.WithSchema(authServiceMethods.ByName("SignUp")),
			connect.WithClientOptions(opts...),
		),
		logIn: connect.NewClient[v1.LogInRequest, v1.LogInResponse](
			httpClient,
			baseURL+AuthServiceLogInProcedure,
			connect.WithSchema(authServiceMethods.ByName("LogIn")),
			connect.WithClientOptions(opts...),
		),
		refreshToken: connect.NewClient[v1.RefreshTokenRequest, v1.RefreshTokenResponse](
			httpClient,
			baseURL+AuthServiceRefreshTokenProcedure,
			connect.WithSchema(authServiceMethods.ByName("RefreshToken")),
			connect.WithClientOptions(opts...),
		),
		logOut: connect.NewClient[v1.LogOutRequest, v1.LogOutResponse](
			httpClient,
			baseURL+AuthServiceLogOutProcedure,
			connect.WithSchema(authServiceMethods.ByName("LogOut")),
			connect.WithClientOptions(opts...),
		),
	}
}

// authServiceClient implements AuthServiceClient.
type authServiceClient struct {
	signUp       *connect.Client[v1.SignUpRequest, v1.SignUpResponse]
	logIn        *connect.Client[v1.LogInRequest, v1.LogInResponse]
	refreshToken *connect.Client[v1.RefreshTokenRequest, v1.RefreshTokenResponse]
	logOut       *connect.Client[v1.LogOutRequest, v1.LogOutResponse]
}

// SignUp calls tattooapp.v1.AuthService.SignUp.
func (c *authServiceClient) SignUp(ctx context.Context, req *connect.Request[v1.SignUpRequest]) (*connect.Response[v1.SignUpResponse], error) {
	return c.signUp.CallUnary(ctx, req)
}

// LogIn calls tattooapp.v1.AuthService.LogIn.
func (c *authServiceClient) LogIn(ctx context.Context, req *connect.Request[v1.LogInRequest]) (*connect.Response[v1.LogInResponse], error) {
	return c.logIn.CallUnary(ctx, req)
}

// RefreshToken calls tattooapp.v1.AuthService.RefreshToken.
func (c *authServiceClient) RefreshToken(ctx context.Context, req *connect.Request[v1.RefreshTokenRequest]) (*connect.Response[v1.RefreshTokenResponse], error) {
	return c.refreshToken.CallUnary(ctx, req)
}

// LogOut calls tattooapp.v1.AuthService.LogOut.
func (c *authServiceClient) LogOut(ctx context.Context, req *connect.Request[v1.LogOutRequest]) (*connect.Response[v1.LogOutResponse], error) {
	return c.logOut.CallUnary(ctx, req)
}

// AuthServiceHandler is an implementation of the tattooapp.v1.AuthService service.
type AuthServiceHandler interface {
	SignUp(context.Context, *connect.Request[v1.SignUpRequest]) (*connect.Response[v1.SignUpResponse], error)
	LogIn(context.Context, *connect.Request[v1.LogInRequest]) (*connect.Response[v1.LogInResponse], error)
	RefreshToken(context.Context, *connect.Request[v1.RefreshTokenRequest]) (*connect.Response[v1.RefreshTokenResponse], error)
	LogOut(context.Context, *connect.Request[v1.LogOutRequest]) (*connect.Response[v1.LogOutResponse], error)
}

// NewAuthServiceHandler builds an HTTP handler from the service implementation. It returns the path
// on which to mount the handler and the handler itself.
//
// By default, handlers support the Connect, gRPC, and gRPC-Web protocols with the binary Protobuf
// and JSON codecs. They also support gzip compression.
func NewAuthServiceHandler(svc AuthServiceHandler, opts ...connect.HandlerOption) (string, http.Handler) {
	authServiceMethods := v1.File_tattooapp_v1_auth_service_proto.Services().ByName("AuthService").Methods()
	authServiceSignUpHandler := connect.NewUnaryHandler(
		AuthServiceSignUpProcedure,
		svc.SignUp,
		connect.WithSchema(authServiceMethods.ByName("SignUp")),
		connect.WithHandlerOptions(opts...),
	)
	authServiceLogInHandler := connect.NewUnaryHandler(
		AuthServiceLogInProcedure,
		svc.LogIn,
		connect.WithSchema(authServiceMethods.ByName("LogIn")),
		connect.WithHandlerOptions(opts...),
	)
	authServiceRefreshTokenHandler := connect.NewUnaryHandler(
		AuthServiceRefreshTokenProcedure,
		svc.RefreshToken,
		connect.WithSchema(authServiceMethods.ByName("RefreshToken")),
		connect.WithHandlerOptions(opts...),
	)
	authServiceLogOutHandler := connect.NewUnaryHandler(
		AuthServiceLogOutProcedure,
		svc.LogOut,
		connect.WithSchema(authServiceMethods.ByName("LogOut")),
		connect.WithHandlerOptions(opts...),
	)
	return "/tattooapp.v1.AuthService/", http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		switch r.URL.Path {
		case AuthServiceSignUpProcedure:
			authServiceSignUpHandler.ServeHTTP(w, r)
		case AuthServiceLogInProcedure:
			authServiceLogInHandler.ServeHTTP(w, r)
		case AuthServiceRefreshTokenProcedure:
			authServiceRefreshTokenHandler.ServeHTTP(w, r)
		case AuthServiceLogOutProcedure:
			authServiceLogOutHandler.ServeHTTP(w, r)
		default:
			http.NotFound(w, r)
		}
	})
}

// UnimplementedAuthServiceHandler returns CodeUnimplemented from all methods.
type UnimplementedAuthServiceHandler struct{}

func (UnimplementedAuthServiceHandler) SignUp(context.Context, *connect.Request[v1.SignUpRequest]) (*connect.Response[v1.SignUpResponse], error) {
	return nil, connect.NewError(connect.CodeUnimplemented, errors.New("tattooapp.v1.AuthService.SignUp is not implemented"))
}

func (UnimplementedAuthServiceHandler) LogIn(context.Context, *connect.Request[v1.LogInRequest]) (*connect.Response[v1.LogInResponse], error) {
	return nil, connect.NewError(connect.CodeUnimplemented, errors.New("tattooapp.v1.AuthService.LogIn is not implemented"))
}

func (UnimplementedAuthServiceHandler) RefreshToken(context.Context, *connect.Request[v1.RefreshTokenRequest]) (*connect.Response[v1.RefreshTokenResponse], error) {
	return nil, connect.NewError(connect.CodeUnimplemented, errors.New("tattooapp.v1.AuthService.RefreshToken is not implemented"))
}

func (UnimplementedAuthServiceHandler) LogOut(context.Context, *connect.Request[v1.LogOutRequest]) (*connect.Response[v1.LogOutResponse], error) {
	return nil, connect.NewError(connect.CodeUnimplemented, errors.New("tattooapp.v1.AuthService.LogOut is not implemented"))
}
