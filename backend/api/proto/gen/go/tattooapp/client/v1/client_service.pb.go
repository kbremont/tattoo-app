// Code generated by protoc-gen-go. DO NOT EDIT.
// versions:
// 	protoc-gen-go v1.36.5
// 	protoc        (unknown)
// source: tattooapp/client/v1/client_service.proto

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

type CreateClientProfileRequest struct {
	state         protoimpl.MessageState `protogen:"open.v1"`
	UserId        string                 `protobuf:"bytes,1,opt,name=user_id,json=userId,proto3" json:"user_id,omitempty"`
	Location      string                 `protobuf:"bytes,2,opt,name=location,proto3" json:"location,omitempty"`
	unknownFields protoimpl.UnknownFields
	sizeCache     protoimpl.SizeCache
}

func (x *CreateClientProfileRequest) Reset() {
	*x = CreateClientProfileRequest{}
	mi := &file_tattooapp_client_v1_client_service_proto_msgTypes[0]
	ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
	ms.StoreMessageInfo(mi)
}

func (x *CreateClientProfileRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*CreateClientProfileRequest) ProtoMessage() {}

func (x *CreateClientProfileRequest) ProtoReflect() protoreflect.Message {
	mi := &file_tattooapp_client_v1_client_service_proto_msgTypes[0]
	if x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use CreateClientProfileRequest.ProtoReflect.Descriptor instead.
func (*CreateClientProfileRequest) Descriptor() ([]byte, []int) {
	return file_tattooapp_client_v1_client_service_proto_rawDescGZIP(), []int{0}
}

func (x *CreateClientProfileRequest) GetUserId() string {
	if x != nil {
		return x.UserId
	}
	return ""
}

func (x *CreateClientProfileRequest) GetLocation() string {
	if x != nil {
		return x.Location
	}
	return ""
}

type CreateClientProfileResponse struct {
	state         protoimpl.MessageState `protogen:"open.v1"`
	ClientProfile *ClientProfile         `protobuf:"bytes,1,opt,name=client_profile,json=clientProfile,proto3" json:"client_profile,omitempty"`
	unknownFields protoimpl.UnknownFields
	sizeCache     protoimpl.SizeCache
}

func (x *CreateClientProfileResponse) Reset() {
	*x = CreateClientProfileResponse{}
	mi := &file_tattooapp_client_v1_client_service_proto_msgTypes[1]
	ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
	ms.StoreMessageInfo(mi)
}

func (x *CreateClientProfileResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*CreateClientProfileResponse) ProtoMessage() {}

func (x *CreateClientProfileResponse) ProtoReflect() protoreflect.Message {
	mi := &file_tattooapp_client_v1_client_service_proto_msgTypes[1]
	if x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use CreateClientProfileResponse.ProtoReflect.Descriptor instead.
func (*CreateClientProfileResponse) Descriptor() ([]byte, []int) {
	return file_tattooapp_client_v1_client_service_proto_rawDescGZIP(), []int{1}
}

func (x *CreateClientProfileResponse) GetClientProfile() *ClientProfile {
	if x != nil {
		return x.ClientProfile
	}
	return nil
}

type GetClientProfileRequest struct {
	state         protoimpl.MessageState `protogen:"open.v1"`
	UserId        string                 `protobuf:"bytes,1,opt,name=user_id,json=userId,proto3" json:"user_id,omitempty"`
	unknownFields protoimpl.UnknownFields
	sizeCache     protoimpl.SizeCache
}

func (x *GetClientProfileRequest) Reset() {
	*x = GetClientProfileRequest{}
	mi := &file_tattooapp_client_v1_client_service_proto_msgTypes[2]
	ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
	ms.StoreMessageInfo(mi)
}

func (x *GetClientProfileRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*GetClientProfileRequest) ProtoMessage() {}

func (x *GetClientProfileRequest) ProtoReflect() protoreflect.Message {
	mi := &file_tattooapp_client_v1_client_service_proto_msgTypes[2]
	if x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use GetClientProfileRequest.ProtoReflect.Descriptor instead.
func (*GetClientProfileRequest) Descriptor() ([]byte, []int) {
	return file_tattooapp_client_v1_client_service_proto_rawDescGZIP(), []int{2}
}

func (x *GetClientProfileRequest) GetUserId() string {
	if x != nil {
		return x.UserId
	}
	return ""
}

type GetClientProfileResponse struct {
	state         protoimpl.MessageState `protogen:"open.v1"`
	ClientProfile *ClientProfile         `protobuf:"bytes,1,opt,name=client_profile,json=clientProfile,proto3" json:"client_profile,omitempty"`
	unknownFields protoimpl.UnknownFields
	sizeCache     protoimpl.SizeCache
}

func (x *GetClientProfileResponse) Reset() {
	*x = GetClientProfileResponse{}
	mi := &file_tattooapp_client_v1_client_service_proto_msgTypes[3]
	ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
	ms.StoreMessageInfo(mi)
}

func (x *GetClientProfileResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*GetClientProfileResponse) ProtoMessage() {}

func (x *GetClientProfileResponse) ProtoReflect() protoreflect.Message {
	mi := &file_tattooapp_client_v1_client_service_proto_msgTypes[3]
	if x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use GetClientProfileResponse.ProtoReflect.Descriptor instead.
func (*GetClientProfileResponse) Descriptor() ([]byte, []int) {
	return file_tattooapp_client_v1_client_service_proto_rawDescGZIP(), []int{3}
}

func (x *GetClientProfileResponse) GetClientProfile() *ClientProfile {
	if x != nil {
		return x.ClientProfile
	}
	return nil
}

type DeleteClientProfileRequest struct {
	state         protoimpl.MessageState `protogen:"open.v1"`
	UserId        string                 `protobuf:"bytes,1,opt,name=user_id,json=userId,proto3" json:"user_id,omitempty"`
	unknownFields protoimpl.UnknownFields
	sizeCache     protoimpl.SizeCache
}

func (x *DeleteClientProfileRequest) Reset() {
	*x = DeleteClientProfileRequest{}
	mi := &file_tattooapp_client_v1_client_service_proto_msgTypes[4]
	ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
	ms.StoreMessageInfo(mi)
}

func (x *DeleteClientProfileRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*DeleteClientProfileRequest) ProtoMessage() {}

func (x *DeleteClientProfileRequest) ProtoReflect() protoreflect.Message {
	mi := &file_tattooapp_client_v1_client_service_proto_msgTypes[4]
	if x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use DeleteClientProfileRequest.ProtoReflect.Descriptor instead.
func (*DeleteClientProfileRequest) Descriptor() ([]byte, []int) {
	return file_tattooapp_client_v1_client_service_proto_rawDescGZIP(), []int{4}
}

func (x *DeleteClientProfileRequest) GetUserId() string {
	if x != nil {
		return x.UserId
	}
	return ""
}

type DeleteClientProfileResponse struct {
	state         protoimpl.MessageState `protogen:"open.v1"`
	Success       bool                   `protobuf:"varint,1,opt,name=success,proto3" json:"success,omitempty"`
	unknownFields protoimpl.UnknownFields
	sizeCache     protoimpl.SizeCache
}

func (x *DeleteClientProfileResponse) Reset() {
	*x = DeleteClientProfileResponse{}
	mi := &file_tattooapp_client_v1_client_service_proto_msgTypes[5]
	ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
	ms.StoreMessageInfo(mi)
}

func (x *DeleteClientProfileResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*DeleteClientProfileResponse) ProtoMessage() {}

func (x *DeleteClientProfileResponse) ProtoReflect() protoreflect.Message {
	mi := &file_tattooapp_client_v1_client_service_proto_msgTypes[5]
	if x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use DeleteClientProfileResponse.ProtoReflect.Descriptor instead.
func (*DeleteClientProfileResponse) Descriptor() ([]byte, []int) {
	return file_tattooapp_client_v1_client_service_proto_rawDescGZIP(), []int{5}
}

func (x *DeleteClientProfileResponse) GetSuccess() bool {
	if x != nil {
		return x.Success
	}
	return false
}

var File_tattooapp_client_v1_client_service_proto protoreflect.FileDescriptor

var file_tattooapp_client_v1_client_service_proto_rawDesc = string([]byte{
	0x0a, 0x28, 0x74, 0x61, 0x74, 0x74, 0x6f, 0x6f, 0x61, 0x70, 0x70, 0x2f, 0x63, 0x6c, 0x69, 0x65,
	0x6e, 0x74, 0x2f, 0x76, 0x31, 0x2f, 0x63, 0x6c, 0x69, 0x65, 0x6e, 0x74, 0x5f, 0x73, 0x65, 0x72,
	0x76, 0x69, 0x63, 0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x12, 0x13, 0x74, 0x61, 0x74, 0x74,
	0x6f, 0x6f, 0x61, 0x70, 0x70, 0x2e, 0x63, 0x6c, 0x69, 0x65, 0x6e, 0x74, 0x2e, 0x76, 0x31, 0x1a,
	0x28, 0x74, 0x61, 0x74, 0x74, 0x6f, 0x6f, 0x61, 0x70, 0x70, 0x2f, 0x63, 0x6c, 0x69, 0x65, 0x6e,
	0x74, 0x2f, 0x76, 0x31, 0x2f, 0x63, 0x6c, 0x69, 0x65, 0x6e, 0x74, 0x5f, 0x70, 0x72, 0x6f, 0x66,
	0x69, 0x6c, 0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x22, 0x51, 0x0a, 0x1a, 0x43, 0x72, 0x65,
	0x61, 0x74, 0x65, 0x43, 0x6c, 0x69, 0x65, 0x6e, 0x74, 0x50, 0x72, 0x6f, 0x66, 0x69, 0x6c, 0x65,
	0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x12, 0x17, 0x0a, 0x07, 0x75, 0x73, 0x65, 0x72, 0x5f,
	0x69, 0x64, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x06, 0x75, 0x73, 0x65, 0x72, 0x49, 0x64,
	0x12, 0x1a, 0x0a, 0x08, 0x6c, 0x6f, 0x63, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x18, 0x02, 0x20, 0x01,
	0x28, 0x09, 0x52, 0x08, 0x6c, 0x6f, 0x63, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x22, 0x68, 0x0a, 0x1b,
	0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x43, 0x6c, 0x69, 0x65, 0x6e, 0x74, 0x50, 0x72, 0x6f, 0x66,
	0x69, 0x6c, 0x65, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12, 0x49, 0x0a, 0x0e, 0x63,
	0x6c, 0x69, 0x65, 0x6e, 0x74, 0x5f, 0x70, 0x72, 0x6f, 0x66, 0x69, 0x6c, 0x65, 0x18, 0x01, 0x20,
	0x01, 0x28, 0x0b, 0x32, 0x22, 0x2e, 0x74, 0x61, 0x74, 0x74, 0x6f, 0x6f, 0x61, 0x70, 0x70, 0x2e,
	0x63, 0x6c, 0x69, 0x65, 0x6e, 0x74, 0x2e, 0x76, 0x31, 0x2e, 0x43, 0x6c, 0x69, 0x65, 0x6e, 0x74,
	0x50, 0x72, 0x6f, 0x66, 0x69, 0x6c, 0x65, 0x52, 0x0d, 0x63, 0x6c, 0x69, 0x65, 0x6e, 0x74, 0x50,
	0x72, 0x6f, 0x66, 0x69, 0x6c, 0x65, 0x22, 0x32, 0x0a, 0x17, 0x47, 0x65, 0x74, 0x43, 0x6c, 0x69,
	0x65, 0x6e, 0x74, 0x50, 0x72, 0x6f, 0x66, 0x69, 0x6c, 0x65, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73,
	0x74, 0x12, 0x17, 0x0a, 0x07, 0x75, 0x73, 0x65, 0x72, 0x5f, 0x69, 0x64, 0x18, 0x01, 0x20, 0x01,
	0x28, 0x09, 0x52, 0x06, 0x75, 0x73, 0x65, 0x72, 0x49, 0x64, 0x22, 0x65, 0x0a, 0x18, 0x47, 0x65,
	0x74, 0x43, 0x6c, 0x69, 0x65, 0x6e, 0x74, 0x50, 0x72, 0x6f, 0x66, 0x69, 0x6c, 0x65, 0x52, 0x65,
	0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12, 0x49, 0x0a, 0x0e, 0x63, 0x6c, 0x69, 0x65, 0x6e, 0x74,
	0x5f, 0x70, 0x72, 0x6f, 0x66, 0x69, 0x6c, 0x65, 0x18, 0x01, 0x20, 0x01, 0x28, 0x0b, 0x32, 0x22,
	0x2e, 0x74, 0x61, 0x74, 0x74, 0x6f, 0x6f, 0x61, 0x70, 0x70, 0x2e, 0x63, 0x6c, 0x69, 0x65, 0x6e,
	0x74, 0x2e, 0x76, 0x31, 0x2e, 0x43, 0x6c, 0x69, 0x65, 0x6e, 0x74, 0x50, 0x72, 0x6f, 0x66, 0x69,
	0x6c, 0x65, 0x52, 0x0d, 0x63, 0x6c, 0x69, 0x65, 0x6e, 0x74, 0x50, 0x72, 0x6f, 0x66, 0x69, 0x6c,
	0x65, 0x22, 0x35, 0x0a, 0x1a, 0x44, 0x65, 0x6c, 0x65, 0x74, 0x65, 0x43, 0x6c, 0x69, 0x65, 0x6e,
	0x74, 0x50, 0x72, 0x6f, 0x66, 0x69, 0x6c, 0x65, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x12,
	0x17, 0x0a, 0x07, 0x75, 0x73, 0x65, 0x72, 0x5f, 0x69, 0x64, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09,
	0x52, 0x06, 0x75, 0x73, 0x65, 0x72, 0x49, 0x64, 0x22, 0x37, 0x0a, 0x1b, 0x44, 0x65, 0x6c, 0x65,
	0x74, 0x65, 0x43, 0x6c, 0x69, 0x65, 0x6e, 0x74, 0x50, 0x72, 0x6f, 0x66, 0x69, 0x6c, 0x65, 0x52,
	0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12, 0x18, 0x0a, 0x07, 0x73, 0x75, 0x63, 0x63, 0x65,
	0x73, 0x73, 0x18, 0x01, 0x20, 0x01, 0x28, 0x08, 0x52, 0x07, 0x73, 0x75, 0x63, 0x63, 0x65, 0x73,
	0x73, 0x32, 0xf4, 0x02, 0x0a, 0x0d, 0x43, 0x6c, 0x69, 0x65, 0x6e, 0x74, 0x53, 0x65, 0x72, 0x76,
	0x69, 0x63, 0x65, 0x12, 0x78, 0x0a, 0x13, 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x43, 0x6c, 0x69,
	0x65, 0x6e, 0x74, 0x50, 0x72, 0x6f, 0x66, 0x69, 0x6c, 0x65, 0x12, 0x2f, 0x2e, 0x74, 0x61, 0x74,
	0x74, 0x6f, 0x6f, 0x61, 0x70, 0x70, 0x2e, 0x63, 0x6c, 0x69, 0x65, 0x6e, 0x74, 0x2e, 0x76, 0x31,
	0x2e, 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x43, 0x6c, 0x69, 0x65, 0x6e, 0x74, 0x50, 0x72, 0x6f,
	0x66, 0x69, 0x6c, 0x65, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x1a, 0x30, 0x2e, 0x74, 0x61,
	0x74, 0x74, 0x6f, 0x6f, 0x61, 0x70, 0x70, 0x2e, 0x63, 0x6c, 0x69, 0x65, 0x6e, 0x74, 0x2e, 0x76,
	0x31, 0x2e, 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x43, 0x6c, 0x69, 0x65, 0x6e, 0x74, 0x50, 0x72,
	0x6f, 0x66, 0x69, 0x6c, 0x65, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12, 0x6f, 0x0a,
	0x10, 0x47, 0x65, 0x74, 0x43, 0x6c, 0x69, 0x65, 0x6e, 0x74, 0x50, 0x72, 0x6f, 0x66, 0x69, 0x6c,
	0x65, 0x12, 0x2c, 0x2e, 0x74, 0x61, 0x74, 0x74, 0x6f, 0x6f, 0x61, 0x70, 0x70, 0x2e, 0x63, 0x6c,
	0x69, 0x65, 0x6e, 0x74, 0x2e, 0x76, 0x31, 0x2e, 0x47, 0x65, 0x74, 0x43, 0x6c, 0x69, 0x65, 0x6e,
	0x74, 0x50, 0x72, 0x6f, 0x66, 0x69, 0x6c, 0x65, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x1a,
	0x2d, 0x2e, 0x74, 0x61, 0x74, 0x74, 0x6f, 0x6f, 0x61, 0x70, 0x70, 0x2e, 0x63, 0x6c, 0x69, 0x65,
	0x6e, 0x74, 0x2e, 0x76, 0x31, 0x2e, 0x47, 0x65, 0x74, 0x43, 0x6c, 0x69, 0x65, 0x6e, 0x74, 0x50,
	0x72, 0x6f, 0x66, 0x69, 0x6c, 0x65, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12, 0x78,
	0x0a, 0x13, 0x44, 0x65, 0x6c, 0x65, 0x74, 0x65, 0x43, 0x6c, 0x69, 0x65, 0x6e, 0x74, 0x50, 0x72,
	0x6f, 0x66, 0x69, 0x6c, 0x65, 0x12, 0x2f, 0x2e, 0x74, 0x61, 0x74, 0x74, 0x6f, 0x6f, 0x61, 0x70,
	0x70, 0x2e, 0x63, 0x6c, 0x69, 0x65, 0x6e, 0x74, 0x2e, 0x76, 0x31, 0x2e, 0x44, 0x65, 0x6c, 0x65,
	0x74, 0x65, 0x43, 0x6c, 0x69, 0x65, 0x6e, 0x74, 0x50, 0x72, 0x6f, 0x66, 0x69, 0x6c, 0x65, 0x52,
	0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x1a, 0x30, 0x2e, 0x74, 0x61, 0x74, 0x74, 0x6f, 0x6f, 0x61,
	0x70, 0x70, 0x2e, 0x63, 0x6c, 0x69, 0x65, 0x6e, 0x74, 0x2e, 0x76, 0x31, 0x2e, 0x44, 0x65, 0x6c,
	0x65, 0x74, 0x65, 0x43, 0x6c, 0x69, 0x65, 0x6e, 0x74, 0x50, 0x72, 0x6f, 0x66, 0x69, 0x6c, 0x65,
	0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x42, 0x50, 0x5a, 0x4e, 0x67, 0x69, 0x74, 0x68,
	0x75, 0x62, 0x2e, 0x63, 0x6f, 0x6d, 0x2f, 0x6b, 0x62, 0x72, 0x65, 0x6d, 0x6f, 0x6e, 0x74, 0x2f,
	0x74, 0x61, 0x74, 0x74, 0x6f, 0x6f, 0x2d, 0x61, 0x70, 0x70, 0x2f, 0x62, 0x61, 0x63, 0x6b, 0x65,
	0x6e, 0x64, 0x2f, 0x61, 0x70, 0x69, 0x2f, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x2f, 0x67, 0x65, 0x6e,
	0x2f, 0x67, 0x6f, 0x2f, 0x74, 0x61, 0x74, 0x74, 0x6f, 0x6f, 0x61, 0x70, 0x70, 0x2f, 0x63, 0x6c,
	0x69, 0x65, 0x6e, 0x74, 0x2f, 0x76, 0x31, 0x3b, 0x70, 0x62, 0x62, 0x06, 0x70, 0x72, 0x6f, 0x74,
	0x6f, 0x33,
})

var (
	file_tattooapp_client_v1_client_service_proto_rawDescOnce sync.Once
	file_tattooapp_client_v1_client_service_proto_rawDescData []byte
)

func file_tattooapp_client_v1_client_service_proto_rawDescGZIP() []byte {
	file_tattooapp_client_v1_client_service_proto_rawDescOnce.Do(func() {
		file_tattooapp_client_v1_client_service_proto_rawDescData = protoimpl.X.CompressGZIP(unsafe.Slice(unsafe.StringData(file_tattooapp_client_v1_client_service_proto_rawDesc), len(file_tattooapp_client_v1_client_service_proto_rawDesc)))
	})
	return file_tattooapp_client_v1_client_service_proto_rawDescData
}

var file_tattooapp_client_v1_client_service_proto_msgTypes = make([]protoimpl.MessageInfo, 6)
var file_tattooapp_client_v1_client_service_proto_goTypes = []any{
	(*CreateClientProfileRequest)(nil),  // 0: tattooapp.client.v1.CreateClientProfileRequest
	(*CreateClientProfileResponse)(nil), // 1: tattooapp.client.v1.CreateClientProfileResponse
	(*GetClientProfileRequest)(nil),     // 2: tattooapp.client.v1.GetClientProfileRequest
	(*GetClientProfileResponse)(nil),    // 3: tattooapp.client.v1.GetClientProfileResponse
	(*DeleteClientProfileRequest)(nil),  // 4: tattooapp.client.v1.DeleteClientProfileRequest
	(*DeleteClientProfileResponse)(nil), // 5: tattooapp.client.v1.DeleteClientProfileResponse
	(*ClientProfile)(nil),               // 6: tattooapp.client.v1.ClientProfile
}
var file_tattooapp_client_v1_client_service_proto_depIdxs = []int32{
	6, // 0: tattooapp.client.v1.CreateClientProfileResponse.client_profile:type_name -> tattooapp.client.v1.ClientProfile
	6, // 1: tattooapp.client.v1.GetClientProfileResponse.client_profile:type_name -> tattooapp.client.v1.ClientProfile
	0, // 2: tattooapp.client.v1.ClientService.CreateClientProfile:input_type -> tattooapp.client.v1.CreateClientProfileRequest
	2, // 3: tattooapp.client.v1.ClientService.GetClientProfile:input_type -> tattooapp.client.v1.GetClientProfileRequest
	4, // 4: tattooapp.client.v1.ClientService.DeleteClientProfile:input_type -> tattooapp.client.v1.DeleteClientProfileRequest
	1, // 5: tattooapp.client.v1.ClientService.CreateClientProfile:output_type -> tattooapp.client.v1.CreateClientProfileResponse
	3, // 6: tattooapp.client.v1.ClientService.GetClientProfile:output_type -> tattooapp.client.v1.GetClientProfileResponse
	5, // 7: tattooapp.client.v1.ClientService.DeleteClientProfile:output_type -> tattooapp.client.v1.DeleteClientProfileResponse
	5, // [5:8] is the sub-list for method output_type
	2, // [2:5] is the sub-list for method input_type
	2, // [2:2] is the sub-list for extension type_name
	2, // [2:2] is the sub-list for extension extendee
	0, // [0:2] is the sub-list for field type_name
}

func init() { file_tattooapp_client_v1_client_service_proto_init() }
func file_tattooapp_client_v1_client_service_proto_init() {
	if File_tattooapp_client_v1_client_service_proto != nil {
		return
	}
	file_tattooapp_client_v1_client_profile_proto_init()
	type x struct{}
	out := protoimpl.TypeBuilder{
		File: protoimpl.DescBuilder{
			GoPackagePath: reflect.TypeOf(x{}).PkgPath(),
			RawDescriptor: unsafe.Slice(unsafe.StringData(file_tattooapp_client_v1_client_service_proto_rawDesc), len(file_tattooapp_client_v1_client_service_proto_rawDesc)),
			NumEnums:      0,
			NumMessages:   6,
			NumExtensions: 0,
			NumServices:   1,
		},
		GoTypes:           file_tattooapp_client_v1_client_service_proto_goTypes,
		DependencyIndexes: file_tattooapp_client_v1_client_service_proto_depIdxs,
		MessageInfos:      file_tattooapp_client_v1_client_service_proto_msgTypes,
	}.Build()
	File_tattooapp_client_v1_client_service_proto = out.File
	file_tattooapp_client_v1_client_service_proto_goTypes = nil
	file_tattooapp_client_v1_client_service_proto_depIdxs = nil
}
