// Code generated by protoc-gen-go. DO NOT EDIT.
// versions:
// 	protoc-gen-go v1.36.5
// 	protoc        (unknown)
// source: tattooapp/v1/auth_service.proto

package pb

import (
	protoreflect "google.golang.org/protobuf/reflect/protoreflect"
	protoimpl "google.golang.org/protobuf/runtime/protoimpl"
	reflect "reflect"
	sync "sync"
	unsafe "unsafe"
)

const (
	// Verify that this generated code is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(20 - protoimpl.MinVersion)
	// Verify that runtime/protoimpl is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(protoimpl.MaxVersion - 20)
)

// information required to sign up a new user
type SignUpRequest struct {
	state         protoimpl.MessageState `protogen:"open.v1"`
	Credentials   *UserCredentials       `protobuf:"bytes,1,opt,name=credentials,proto3" json:"credentials,omitempty"`
	unknownFields protoimpl.UnknownFields
	sizeCache     protoimpl.SizeCache
}

func (x *SignUpRequest) Reset() {
	*x = SignUpRequest{}
	mi := &file_tattooapp_v1_auth_service_proto_msgTypes[0]
	ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
	ms.StoreMessageInfo(mi)
}

func (x *SignUpRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*SignUpRequest) ProtoMessage() {}

func (x *SignUpRequest) ProtoReflect() protoreflect.Message {
	mi := &file_tattooapp_v1_auth_service_proto_msgTypes[0]
	if x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use SignUpRequest.ProtoReflect.Descriptor instead.
func (*SignUpRequest) Descriptor() ([]byte, []int) {
	return file_tattooapp_v1_auth_service_proto_rawDescGZIP(), []int{0}
}

func (x *SignUpRequest) GetCredentials() *UserCredentials {
	if x != nil {
		return x.Credentials
	}
	return nil
}

// information returned after signing up a new user
type SignUpResponse struct {
	state         protoimpl.MessageState `protogen:"open.v1"`
	User          *UserId                `protobuf:"bytes,1,opt,name=user,proto3" json:"user,omitempty"`
	Token         *AuthToken             `protobuf:"bytes,2,opt,name=token,proto3" json:"token,omitempty"`
	unknownFields protoimpl.UnknownFields
	sizeCache     protoimpl.SizeCache
}

func (x *SignUpResponse) Reset() {
	*x = SignUpResponse{}
	mi := &file_tattooapp_v1_auth_service_proto_msgTypes[1]
	ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
	ms.StoreMessageInfo(mi)
}

func (x *SignUpResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*SignUpResponse) ProtoMessage() {}

func (x *SignUpResponse) ProtoReflect() protoreflect.Message {
	mi := &file_tattooapp_v1_auth_service_proto_msgTypes[1]
	if x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use SignUpResponse.ProtoReflect.Descriptor instead.
func (*SignUpResponse) Descriptor() ([]byte, []int) {
	return file_tattooapp_v1_auth_service_proto_rawDescGZIP(), []int{1}
}

func (x *SignUpResponse) GetUser() *UserId {
	if x != nil {
		return x.User
	}
	return nil
}

func (x *SignUpResponse) GetToken() *AuthToken {
	if x != nil {
		return x.Token
	}
	return nil
}

// information required to log in a user
type LogInRequest struct {
	state         protoimpl.MessageState `protogen:"open.v1"`
	Credentials   *UserCredentials       `protobuf:"bytes,1,opt,name=credentials,proto3" json:"credentials,omitempty"`
	unknownFields protoimpl.UnknownFields
	sizeCache     protoimpl.SizeCache
}

func (x *LogInRequest) Reset() {
	*x = LogInRequest{}
	mi := &file_tattooapp_v1_auth_service_proto_msgTypes[2]
	ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
	ms.StoreMessageInfo(mi)
}

func (x *LogInRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*LogInRequest) ProtoMessage() {}

func (x *LogInRequest) ProtoReflect() protoreflect.Message {
	mi := &file_tattooapp_v1_auth_service_proto_msgTypes[2]
	if x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use LogInRequest.ProtoReflect.Descriptor instead.
func (*LogInRequest) Descriptor() ([]byte, []int) {
	return file_tattooapp_v1_auth_service_proto_rawDescGZIP(), []int{2}
}

func (x *LogInRequest) GetCredentials() *UserCredentials {
	if x != nil {
		return x.Credentials
	}
	return nil
}

// information returned after logging in a user
type LogInResponse struct {
	state         protoimpl.MessageState `protogen:"open.v1"`
	User          *UserId                `protobuf:"bytes,1,opt,name=user,proto3" json:"user,omitempty"`
	Token         *AuthToken             `protobuf:"bytes,2,opt,name=token,proto3" json:"token,omitempty"`
	unknownFields protoimpl.UnknownFields
	sizeCache     protoimpl.SizeCache
}

func (x *LogInResponse) Reset() {
	*x = LogInResponse{}
	mi := &file_tattooapp_v1_auth_service_proto_msgTypes[3]
	ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
	ms.StoreMessageInfo(mi)
}

func (x *LogInResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*LogInResponse) ProtoMessage() {}

func (x *LogInResponse) ProtoReflect() protoreflect.Message {
	mi := &file_tattooapp_v1_auth_service_proto_msgTypes[3]
	if x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use LogInResponse.ProtoReflect.Descriptor instead.
func (*LogInResponse) Descriptor() ([]byte, []int) {
	return file_tattooapp_v1_auth_service_proto_rawDescGZIP(), []int{3}
}

func (x *LogInResponse) GetUser() *UserId {
	if x != nil {
		return x.User
	}
	return nil
}

func (x *LogInResponse) GetToken() *AuthToken {
	if x != nil {
		return x.Token
	}
	return nil
}

// information required to refresh an access token
type RefreshTokenRequest struct {
	state         protoimpl.MessageState `protogen:"open.v1"`
	RefreshToken  string                 `protobuf:"bytes,1,opt,name=refresh_token,json=refreshToken,proto3" json:"refresh_token,omitempty"`
	unknownFields protoimpl.UnknownFields
	sizeCache     protoimpl.SizeCache
}

func (x *RefreshTokenRequest) Reset() {
	*x = RefreshTokenRequest{}
	mi := &file_tattooapp_v1_auth_service_proto_msgTypes[4]
	ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
	ms.StoreMessageInfo(mi)
}

func (x *RefreshTokenRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*RefreshTokenRequest) ProtoMessage() {}

func (x *RefreshTokenRequest) ProtoReflect() protoreflect.Message {
	mi := &file_tattooapp_v1_auth_service_proto_msgTypes[4]
	if x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use RefreshTokenRequest.ProtoReflect.Descriptor instead.
func (*RefreshTokenRequest) Descriptor() ([]byte, []int) {
	return file_tattooapp_v1_auth_service_proto_rawDescGZIP(), []int{4}
}

func (x *RefreshTokenRequest) GetRefreshToken() string {
	if x != nil {
		return x.RefreshToken
	}
	return ""
}

// information returned after refreshing an access token
type RefreshTokenResponse struct {
	state         protoimpl.MessageState `protogen:"open.v1"`
	Token         *AuthToken             `protobuf:"bytes,1,opt,name=token,proto3" json:"token,omitempty"`
	unknownFields protoimpl.UnknownFields
	sizeCache     protoimpl.SizeCache
}

func (x *RefreshTokenResponse) Reset() {
	*x = RefreshTokenResponse{}
	mi := &file_tattooapp_v1_auth_service_proto_msgTypes[5]
	ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
	ms.StoreMessageInfo(mi)
}

func (x *RefreshTokenResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*RefreshTokenResponse) ProtoMessage() {}

func (x *RefreshTokenResponse) ProtoReflect() protoreflect.Message {
	mi := &file_tattooapp_v1_auth_service_proto_msgTypes[5]
	if x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use RefreshTokenResponse.ProtoReflect.Descriptor instead.
func (*RefreshTokenResponse) Descriptor() ([]byte, []int) {
	return file_tattooapp_v1_auth_service_proto_rawDescGZIP(), []int{5}
}

func (x *RefreshTokenResponse) GetToken() *AuthToken {
	if x != nil {
		return x.Token
	}
	return nil
}

// information required to log out a user
type LogOutRequest struct {
	state         protoimpl.MessageState `protogen:"open.v1"`
	RefreshToken  string                 `protobuf:"bytes,1,opt,name=refresh_token,json=refreshToken,proto3" json:"refresh_token,omitempty"`
	unknownFields protoimpl.UnknownFields
	sizeCache     protoimpl.SizeCache
}

func (x *LogOutRequest) Reset() {
	*x = LogOutRequest{}
	mi := &file_tattooapp_v1_auth_service_proto_msgTypes[6]
	ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
	ms.StoreMessageInfo(mi)
}

func (x *LogOutRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*LogOutRequest) ProtoMessage() {}

func (x *LogOutRequest) ProtoReflect() protoreflect.Message {
	mi := &file_tattooapp_v1_auth_service_proto_msgTypes[6]
	if x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use LogOutRequest.ProtoReflect.Descriptor instead.
func (*LogOutRequest) Descriptor() ([]byte, []int) {
	return file_tattooapp_v1_auth_service_proto_rawDescGZIP(), []int{6}
}

func (x *LogOutRequest) GetRefreshToken() string {
	if x != nil {
		return x.RefreshToken
	}
	return ""
}

// information returned after logging out a user
type LogOutResponse struct {
	state         protoimpl.MessageState `protogen:"open.v1"`
	Success       bool                   `protobuf:"varint,1,opt,name=success,proto3" json:"success,omitempty"`
	unknownFields protoimpl.UnknownFields
	sizeCache     protoimpl.SizeCache
}

func (x *LogOutResponse) Reset() {
	*x = LogOutResponse{}
	mi := &file_tattooapp_v1_auth_service_proto_msgTypes[7]
	ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
	ms.StoreMessageInfo(mi)
}

func (x *LogOutResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*LogOutResponse) ProtoMessage() {}

func (x *LogOutResponse) ProtoReflect() protoreflect.Message {
	mi := &file_tattooapp_v1_auth_service_proto_msgTypes[7]
	if x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use LogOutResponse.ProtoReflect.Descriptor instead.
func (*LogOutResponse) Descriptor() ([]byte, []int) {
	return file_tattooapp_v1_auth_service_proto_rawDescGZIP(), []int{7}
}

func (x *LogOutResponse) GetSuccess() bool {
	if x != nil {
		return x.Success
	}
	return false
}

var File_tattooapp_v1_auth_service_proto protoreflect.FileDescriptor

var file_tattooapp_v1_auth_service_proto_rawDesc = string([]byte{
	0x0a, 0x1f, 0x74, 0x61, 0x74, 0x74, 0x6f, 0x6f, 0x61, 0x70, 0x70, 0x2f, 0x76, 0x31, 0x2f, 0x61,
	0x75, 0x74, 0x68, 0x5f, 0x73, 0x65, 0x72, 0x76, 0x69, 0x63, 0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74,
	0x6f, 0x12, 0x0c, 0x74, 0x61, 0x74, 0x74, 0x6f, 0x6f, 0x61, 0x70, 0x70, 0x2e, 0x76, 0x31, 0x1a,
	0x17, 0x74, 0x61, 0x74, 0x74, 0x6f, 0x6f, 0x61, 0x70, 0x70, 0x2f, 0x76, 0x31, 0x2f, 0x61, 0x75,
	0x74, 0x68, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x22, 0x50, 0x0a, 0x0d, 0x53, 0x69, 0x67, 0x6e,
	0x55, 0x70, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x12, 0x3f, 0x0a, 0x0b, 0x63, 0x72, 0x65,
	0x64, 0x65, 0x6e, 0x74, 0x69, 0x61, 0x6c, 0x73, 0x18, 0x01, 0x20, 0x01, 0x28, 0x0b, 0x32, 0x1d,
	0x2e, 0x74, 0x61, 0x74, 0x74, 0x6f, 0x6f, 0x61, 0x70, 0x70, 0x2e, 0x76, 0x31, 0x2e, 0x55, 0x73,
	0x65, 0x72, 0x43, 0x72, 0x65, 0x64, 0x65, 0x6e, 0x74, 0x69, 0x61, 0x6c, 0x73, 0x52, 0x0b, 0x63,
	0x72, 0x65, 0x64, 0x65, 0x6e, 0x74, 0x69, 0x61, 0x6c, 0x73, 0x22, 0x69, 0x0a, 0x0e, 0x53, 0x69,
	0x67, 0x6e, 0x55, 0x70, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12, 0x28, 0x0a, 0x04,
	0x75, 0x73, 0x65, 0x72, 0x18, 0x01, 0x20, 0x01, 0x28, 0x0b, 0x32, 0x14, 0x2e, 0x74, 0x61, 0x74,
	0x74, 0x6f, 0x6f, 0x61, 0x70, 0x70, 0x2e, 0x76, 0x31, 0x2e, 0x55, 0x73, 0x65, 0x72, 0x49, 0x64,
	0x52, 0x04, 0x75, 0x73, 0x65, 0x72, 0x12, 0x2d, 0x0a, 0x05, 0x74, 0x6f, 0x6b, 0x65, 0x6e, 0x18,
	0x02, 0x20, 0x01, 0x28, 0x0b, 0x32, 0x17, 0x2e, 0x74, 0x61, 0x74, 0x74, 0x6f, 0x6f, 0x61, 0x70,
	0x70, 0x2e, 0x76, 0x31, 0x2e, 0x41, 0x75, 0x74, 0x68, 0x54, 0x6f, 0x6b, 0x65, 0x6e, 0x52, 0x05,
	0x74, 0x6f, 0x6b, 0x65, 0x6e, 0x22, 0x4f, 0x0a, 0x0c, 0x4c, 0x6f, 0x67, 0x49, 0x6e, 0x52, 0x65,
	0x71, 0x75, 0x65, 0x73, 0x74, 0x12, 0x3f, 0x0a, 0x0b, 0x63, 0x72, 0x65, 0x64, 0x65, 0x6e, 0x74,
	0x69, 0x61, 0x6c, 0x73, 0x18, 0x01, 0x20, 0x01, 0x28, 0x0b, 0x32, 0x1d, 0x2e, 0x74, 0x61, 0x74,
	0x74, 0x6f, 0x6f, 0x61, 0x70, 0x70, 0x2e, 0x76, 0x31, 0x2e, 0x55, 0x73, 0x65, 0x72, 0x43, 0x72,
	0x65, 0x64, 0x65, 0x6e, 0x74, 0x69, 0x61, 0x6c, 0x73, 0x52, 0x0b, 0x63, 0x72, 0x65, 0x64, 0x65,
	0x6e, 0x74, 0x69, 0x61, 0x6c, 0x73, 0x22, 0x68, 0x0a, 0x0d, 0x4c, 0x6f, 0x67, 0x49, 0x6e, 0x52,
	0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12, 0x28, 0x0a, 0x04, 0x75, 0x73, 0x65, 0x72, 0x18,
	0x01, 0x20, 0x01, 0x28, 0x0b, 0x32, 0x14, 0x2e, 0x74, 0x61, 0x74, 0x74, 0x6f, 0x6f, 0x61, 0x70,
	0x70, 0x2e, 0x76, 0x31, 0x2e, 0x55, 0x73, 0x65, 0x72, 0x49, 0x64, 0x52, 0x04, 0x75, 0x73, 0x65,
	0x72, 0x12, 0x2d, 0x0a, 0x05, 0x74, 0x6f, 0x6b, 0x65, 0x6e, 0x18, 0x02, 0x20, 0x01, 0x28, 0x0b,
	0x32, 0x17, 0x2e, 0x74, 0x61, 0x74, 0x74, 0x6f, 0x6f, 0x61, 0x70, 0x70, 0x2e, 0x76, 0x31, 0x2e,
	0x41, 0x75, 0x74, 0x68, 0x54, 0x6f, 0x6b, 0x65, 0x6e, 0x52, 0x05, 0x74, 0x6f, 0x6b, 0x65, 0x6e,
	0x22, 0x3a, 0x0a, 0x13, 0x52, 0x65, 0x66, 0x72, 0x65, 0x73, 0x68, 0x54, 0x6f, 0x6b, 0x65, 0x6e,
	0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x12, 0x23, 0x0a, 0x0d, 0x72, 0x65, 0x66, 0x72, 0x65,
	0x73, 0x68, 0x5f, 0x74, 0x6f, 0x6b, 0x65, 0x6e, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x0c,
	0x72, 0x65, 0x66, 0x72, 0x65, 0x73, 0x68, 0x54, 0x6f, 0x6b, 0x65, 0x6e, 0x22, 0x45, 0x0a, 0x14,
	0x52, 0x65, 0x66, 0x72, 0x65, 0x73, 0x68, 0x54, 0x6f, 0x6b, 0x65, 0x6e, 0x52, 0x65, 0x73, 0x70,
	0x6f, 0x6e, 0x73, 0x65, 0x12, 0x2d, 0x0a, 0x05, 0x74, 0x6f, 0x6b, 0x65, 0x6e, 0x18, 0x01, 0x20,
	0x01, 0x28, 0x0b, 0x32, 0x17, 0x2e, 0x74, 0x61, 0x74, 0x74, 0x6f, 0x6f, 0x61, 0x70, 0x70, 0x2e,
	0x76, 0x31, 0x2e, 0x41, 0x75, 0x74, 0x68, 0x54, 0x6f, 0x6b, 0x65, 0x6e, 0x52, 0x05, 0x74, 0x6f,
	0x6b, 0x65, 0x6e, 0x22, 0x34, 0x0a, 0x0d, 0x4c, 0x6f, 0x67, 0x4f, 0x75, 0x74, 0x52, 0x65, 0x71,
	0x75, 0x65, 0x73, 0x74, 0x12, 0x23, 0x0a, 0x0d, 0x72, 0x65, 0x66, 0x72, 0x65, 0x73, 0x68, 0x5f,
	0x74, 0x6f, 0x6b, 0x65, 0x6e, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x0c, 0x72, 0x65, 0x66,
	0x72, 0x65, 0x73, 0x68, 0x54, 0x6f, 0x6b, 0x65, 0x6e, 0x22, 0x2a, 0x0a, 0x0e, 0x4c, 0x6f, 0x67,
	0x4f, 0x75, 0x74, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12, 0x18, 0x0a, 0x07, 0x73,
	0x75, 0x63, 0x63, 0x65, 0x73, 0x73, 0x18, 0x01, 0x20, 0x01, 0x28, 0x08, 0x52, 0x07, 0x73, 0x75,
	0x63, 0x63, 0x65, 0x73, 0x73, 0x32, 0xb0, 0x02, 0x0a, 0x0b, 0x41, 0x75, 0x74, 0x68, 0x53, 0x65,
	0x72, 0x76, 0x69, 0x63, 0x65, 0x12, 0x43, 0x0a, 0x06, 0x53, 0x69, 0x67, 0x6e, 0x55, 0x70, 0x12,
	0x1b, 0x2e, 0x74, 0x61, 0x74, 0x74, 0x6f, 0x6f, 0x61, 0x70, 0x70, 0x2e, 0x76, 0x31, 0x2e, 0x53,
	0x69, 0x67, 0x6e, 0x55, 0x70, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x1a, 0x1c, 0x2e, 0x74,
	0x61, 0x74, 0x74, 0x6f, 0x6f, 0x61, 0x70, 0x70, 0x2e, 0x76, 0x31, 0x2e, 0x53, 0x69, 0x67, 0x6e,
	0x55, 0x70, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12, 0x40, 0x0a, 0x05, 0x4c, 0x6f,
	0x67, 0x49, 0x6e, 0x12, 0x1a, 0x2e, 0x74, 0x61, 0x74, 0x74, 0x6f, 0x6f, 0x61, 0x70, 0x70, 0x2e,
	0x76, 0x31, 0x2e, 0x4c, 0x6f, 0x67, 0x49, 0x6e, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x1a,
	0x1b, 0x2e, 0x74, 0x61, 0x74, 0x74, 0x6f, 0x6f, 0x61, 0x70, 0x70, 0x2e, 0x76, 0x31, 0x2e, 0x4c,
	0x6f, 0x67, 0x49, 0x6e, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12, 0x55, 0x0a, 0x0c,
	0x52, 0x65, 0x66, 0x72, 0x65, 0x73, 0x68, 0x54, 0x6f, 0x6b, 0x65, 0x6e, 0x12, 0x21, 0x2e, 0x74,
	0x61, 0x74, 0x74, 0x6f, 0x6f, 0x61, 0x70, 0x70, 0x2e, 0x76, 0x31, 0x2e, 0x52, 0x65, 0x66, 0x72,
	0x65, 0x73, 0x68, 0x54, 0x6f, 0x6b, 0x65, 0x6e, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x1a,
	0x22, 0x2e, 0x74, 0x61, 0x74, 0x74, 0x6f, 0x6f, 0x61, 0x70, 0x70, 0x2e, 0x76, 0x31, 0x2e, 0x52,
	0x65, 0x66, 0x72, 0x65, 0x73, 0x68, 0x54, 0x6f, 0x6b, 0x65, 0x6e, 0x52, 0x65, 0x73, 0x70, 0x6f,
	0x6e, 0x73, 0x65, 0x12, 0x43, 0x0a, 0x06, 0x4c, 0x6f, 0x67, 0x4f, 0x75, 0x74, 0x12, 0x1b, 0x2e,
	0x74, 0x61, 0x74, 0x74, 0x6f, 0x6f, 0x61, 0x70, 0x70, 0x2e, 0x76, 0x31, 0x2e, 0x4c, 0x6f, 0x67,
	0x4f, 0x75, 0x74, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x1a, 0x1c, 0x2e, 0x74, 0x61, 0x74,
	0x74, 0x6f, 0x6f, 0x61, 0x70, 0x70, 0x2e, 0x76, 0x31, 0x2e, 0x4c, 0x6f, 0x67, 0x4f, 0x75, 0x74,
	0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x42, 0x41, 0x5a, 0x3f, 0x67, 0x69, 0x74, 0x68,
	0x75, 0x62, 0x2e, 0x63, 0x6f, 0x6d, 0x2f, 0x6b, 0x62, 0x72, 0x65, 0x6d, 0x6f, 0x6e, 0x74, 0x2f,
	0x74, 0x61, 0x74, 0x74, 0x6f, 0x6f, 0x2d, 0x61, 0x70, 0x70, 0x2f, 0x61, 0x70, 0x69, 0x2f, 0x70,
	0x72, 0x6f, 0x74, 0x6f, 0x2f, 0x67, 0x65, 0x6e, 0x2f, 0x67, 0x6f, 0x2f, 0x74, 0x61, 0x74, 0x74,
	0x6f, 0x6f, 0x61, 0x70, 0x70, 0x2f, 0x76, 0x31, 0x3b, 0x70, 0x62, 0x62, 0x06, 0x70, 0x72, 0x6f,
	0x74, 0x6f, 0x33,
})

var (
	file_tattooapp_v1_auth_service_proto_rawDescOnce sync.Once
	file_tattooapp_v1_auth_service_proto_rawDescData []byte
)

func file_tattooapp_v1_auth_service_proto_rawDescGZIP() []byte {
	file_tattooapp_v1_auth_service_proto_rawDescOnce.Do(func() {
		file_tattooapp_v1_auth_service_proto_rawDescData = protoimpl.X.CompressGZIP(unsafe.Slice(unsafe.StringData(file_tattooapp_v1_auth_service_proto_rawDesc), len(file_tattooapp_v1_auth_service_proto_rawDesc)))
	})
	return file_tattooapp_v1_auth_service_proto_rawDescData
}

var file_tattooapp_v1_auth_service_proto_msgTypes = make([]protoimpl.MessageInfo, 8)
var file_tattooapp_v1_auth_service_proto_goTypes = []any{
	(*SignUpRequest)(nil),        // 0: tattooapp.v1.SignUpRequest
	(*SignUpResponse)(nil),       // 1: tattooapp.v1.SignUpResponse
	(*LogInRequest)(nil),         // 2: tattooapp.v1.LogInRequest
	(*LogInResponse)(nil),        // 3: tattooapp.v1.LogInResponse
	(*RefreshTokenRequest)(nil),  // 4: tattooapp.v1.RefreshTokenRequest
	(*RefreshTokenResponse)(nil), // 5: tattooapp.v1.RefreshTokenResponse
	(*LogOutRequest)(nil),        // 6: tattooapp.v1.LogOutRequest
	(*LogOutResponse)(nil),       // 7: tattooapp.v1.LogOutResponse
	(*UserCredentials)(nil),      // 8: tattooapp.v1.UserCredentials
	(*UserId)(nil),               // 9: tattooapp.v1.UserId
	(*AuthToken)(nil),            // 10: tattooapp.v1.AuthToken
}
var file_tattooapp_v1_auth_service_proto_depIdxs = []int32{
	8,  // 0: tattooapp.v1.SignUpRequest.credentials:type_name -> tattooapp.v1.UserCredentials
	9,  // 1: tattooapp.v1.SignUpResponse.user:type_name -> tattooapp.v1.UserId
	10, // 2: tattooapp.v1.SignUpResponse.token:type_name -> tattooapp.v1.AuthToken
	8,  // 3: tattooapp.v1.LogInRequest.credentials:type_name -> tattooapp.v1.UserCredentials
	9,  // 4: tattooapp.v1.LogInResponse.user:type_name -> tattooapp.v1.UserId
	10, // 5: tattooapp.v1.LogInResponse.token:type_name -> tattooapp.v1.AuthToken
	10, // 6: tattooapp.v1.RefreshTokenResponse.token:type_name -> tattooapp.v1.AuthToken
	0,  // 7: tattooapp.v1.AuthService.SignUp:input_type -> tattooapp.v1.SignUpRequest
	2,  // 8: tattooapp.v1.AuthService.LogIn:input_type -> tattooapp.v1.LogInRequest
	4,  // 9: tattooapp.v1.AuthService.RefreshToken:input_type -> tattooapp.v1.RefreshTokenRequest
	6,  // 10: tattooapp.v1.AuthService.LogOut:input_type -> tattooapp.v1.LogOutRequest
	1,  // 11: tattooapp.v1.AuthService.SignUp:output_type -> tattooapp.v1.SignUpResponse
	3,  // 12: tattooapp.v1.AuthService.LogIn:output_type -> tattooapp.v1.LogInResponse
	5,  // 13: tattooapp.v1.AuthService.RefreshToken:output_type -> tattooapp.v1.RefreshTokenResponse
	7,  // 14: tattooapp.v1.AuthService.LogOut:output_type -> tattooapp.v1.LogOutResponse
	11, // [11:15] is the sub-list for method output_type
	7,  // [7:11] is the sub-list for method input_type
	7,  // [7:7] is the sub-list for extension type_name
	7,  // [7:7] is the sub-list for extension extendee
	0,  // [0:7] is the sub-list for field type_name
}

func init() { file_tattooapp_v1_auth_service_proto_init() }
func file_tattooapp_v1_auth_service_proto_init() {
	if File_tattooapp_v1_auth_service_proto != nil {
		return
	}
	file_tattooapp_v1_auth_proto_init()
	type x struct{}
	out := protoimpl.TypeBuilder{
		File: protoimpl.DescBuilder{
			GoPackagePath: reflect.TypeOf(x{}).PkgPath(),
			RawDescriptor: unsafe.Slice(unsafe.StringData(file_tattooapp_v1_auth_service_proto_rawDesc), len(file_tattooapp_v1_auth_service_proto_rawDesc)),
			NumEnums:      0,
			NumMessages:   8,
			NumExtensions: 0,
			NumServices:   1,
		},
		GoTypes:           file_tattooapp_v1_auth_service_proto_goTypes,
		DependencyIndexes: file_tattooapp_v1_auth_service_proto_depIdxs,
		MessageInfos:      file_tattooapp_v1_auth_service_proto_msgTypes,
	}.Build()
	File_tattooapp_v1_auth_service_proto = out.File
	file_tattooapp_v1_auth_service_proto_goTypes = nil
	file_tattooapp_v1_auth_service_proto_depIdxs = nil
}
