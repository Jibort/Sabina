// Representació dels dispositius d'usuari.
// createdAt: 24/09/10 dm. JIQ

// Code generated by protoc-gen-go. DO NOT EDIT.
// versions:
// 	protoc-gen-go v1.32.0
// 	protoc        v4.25.1
// source: usrmod/usr_device.proto

package __

import (
	protoreflect "google.golang.org/protobuf/reflect/protoreflect"
	protoimpl "google.golang.org/protobuf/runtime/protoimpl"
	reflect "reflect"
	sync "sync"
	base "sabina/base"
)

const (
	// Verify that this generated code is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(20 - protoimpl.MinVersion)
	// Verify that runtime/protoimpl is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(protoimpl.MaxVersion - 20)
)

// Tipus dels dispositius d'usuari.
type UsrDeviceType int32

const (
	UsrDeviceType_USR_DEVICE_TYPE_DEVICE_TYPE_UNSPECIFIED UsrDeviceType = 0
	UsrDeviceType_USR_DEVICE_TYPE_ANDROID_MOBILE          UsrDeviceType = 1
	UsrDeviceType_USR_DEVICE_TYPE_ANDROID_TABLET          UsrDeviceType = 2
	UsrDeviceType_USR_DEVICE_TYPE_IOS_MOBILE              UsrDeviceType = 3
	UsrDeviceType_USR_DEVICE_TYPE_IOS_TABLET              UsrDeviceType = 4
	UsrDeviceType_USR_DEVICE_TYPE_WINDOWS                 UsrDeviceType = 5
	UsrDeviceType_USR_DEVICE_TYPE_MACOS                   UsrDeviceType = 6
	UsrDeviceType_USR_DEVICE_TYPE_LINUX                   UsrDeviceType = 7
)

// Enum value maps for UsrDeviceType.
var (
	UsrDeviceType_name = map[int32]string{
		0: "USR_DEVICE_TYPE_DEVICE_TYPE_UNSPECIFIED",
		1: "USR_DEVICE_TYPE_ANDROID_MOBILE",
		2: "USR_DEVICE_TYPE_ANDROID_TABLET",
		3: "USR_DEVICE_TYPE_IOS_MOBILE",
		4: "USR_DEVICE_TYPE_IOS_TABLET",
		5: "USR_DEVICE_TYPE_WINDOWS",
		6: "USR_DEVICE_TYPE_MACOS",
		7: "USR_DEVICE_TYPE_LINUX",
	}
	UsrDeviceType_value = map[string]int32{
		"USR_DEVICE_TYPE_DEVICE_TYPE_UNSPECIFIED": 0,
		"USR_DEVICE_TYPE_ANDROID_MOBILE":          1,
		"USR_DEVICE_TYPE_ANDROID_TABLET":          2,
		"USR_DEVICE_TYPE_IOS_MOBILE":              3,
		"USR_DEVICE_TYPE_IOS_TABLET":              4,
		"USR_DEVICE_TYPE_WINDOWS":                 5,
		"USR_DEVICE_TYPE_MACOS":                   6,
		"USR_DEVICE_TYPE_LINUX":                   7,
	}
)

func (x UsrDeviceType) Enum() *UsrDeviceType {
	p := new(UsrDeviceType)
	*p = x
	return p
}

func (x UsrDeviceType) String() string {
	return protoimpl.X.EnumStringOf(x.Descriptor(), protoreflect.EnumNumber(x))
}

func (UsrDeviceType) Descriptor() protoreflect.EnumDescriptor {
	return file_usrmod_usr_device_proto_enumTypes[0].Descriptor()
}

func (UsrDeviceType) Type() protoreflect.EnumType {
	return &file_usrmod_usr_device_proto_enumTypes[0]
}

func (x UsrDeviceType) Number() protoreflect.EnumNumber {
	return protoreflect.EnumNumber(x)
}

// Deprecated: Use UsrDeviceType.Descriptor instead.
func (UsrDeviceType) EnumDescriptor() ([]byte, []int) {
	return file_usrmod_usr_device_proto_rawDescGZIP(), []int{0}
}

// Estats dels dispositius d'usuari.
type UsrDeviceState int32

const (
	UsrDeviceState_USR_DEVICE_STATE_UNSPECIFIED UsrDeviceState = 0
	UsrDeviceState_USR_DEVICE_STATE_ENABLED     UsrDeviceState = 1
	UsrDeviceState_USR_DEVICE_STATE_DISABLED    UsrDeviceState = 2
)

// Enum value maps for UsrDeviceState.
var (
	UsrDeviceState_name = map[int32]string{
		0: "USR_DEVICE_STATE_UNSPECIFIED",
		1: "USR_DEVICE_STATE_ENABLED",
		2: "USR_DEVICE_STATE_DISABLED",
	}
	UsrDeviceState_value = map[string]int32{
		"USR_DEVICE_STATE_UNSPECIFIED": 0,
		"USR_DEVICE_STATE_ENABLED":     1,
		"USR_DEVICE_STATE_DISABLED":    2,
	}
)

func (x UsrDeviceState) Enum() *UsrDeviceState {
	p := new(UsrDeviceState)
	*p = x
	return p
}

func (x UsrDeviceState) String() string {
	return protoimpl.X.EnumStringOf(x.Descriptor(), protoreflect.EnumNumber(x))
}

func (UsrDeviceState) Descriptor() protoreflect.EnumDescriptor {
	return file_usrmod_usr_device_proto_enumTypes[1].Descriptor()
}

func (UsrDeviceState) Type() protoreflect.EnumType {
	return &file_usrmod_usr_device_proto_enumTypes[1]
}

func (x UsrDeviceState) Number() protoreflect.EnumNumber {
	return protoreflect.EnumNumber(x)
}

// Deprecated: Use UsrDeviceState.Descriptor instead.
func (UsrDeviceState) EnumDescriptor() ([]byte, []int) {
	return file_usrmod_usr_device_proto_rawDescGZIP(), []int{1}
}

// Representació dels dispositius d'usuari.
type UsrDevice struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	BaseEntity *BaseEntity    `protobuf:"bytes,1,opt,name=base_entity,json=baseEntity,proto3" json:"base_entity,omitempty"`
	Type       UsrDeviceType  `protobuf:"varint,2,opt,name=type,proto3,enum=proto.UsrDeviceType" json:"type,omitempty"`
	State      UsrDeviceState `protobuf:"varint,3,opt,name=state,proto3,enum=proto.UsrDeviceState" json:"state,omitempty"`
	Token      *string        `protobuf:"bytes,4,opt,name=token,proto3,oneof" json:"token,omitempty"`
	Owner      uint32         `protobuf:"varint,5,opt,name=owner,proto3" json:"owner,omitempty"`
}

func (x *UsrDevice) Reset() {
	*x = UsrDevice{}
	if protoimpl.UnsafeEnabled {
		mi := &file_usrmod_usr_device_proto_msgTypes[0]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *UsrDevice) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*UsrDevice) ProtoMessage() {}

func (x *UsrDevice) ProtoReflect() protoreflect.Message {
	mi := &file_usrmod_usr_device_proto_msgTypes[0]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use UsrDevice.ProtoReflect.Descriptor instead.
func (*UsrDevice) Descriptor() ([]byte, []int) {
	return file_usrmod_usr_device_proto_rawDescGZIP(), []int{0}
}

func (x *UsrDevice) GetBaseEntity() *BaseEntity {
	if x != nil {
		return x.BaseEntity
	}
	return nil
}

func (x *UsrDevice) GetType() UsrDeviceType {
	if x != nil {
		return x.Type
	}
	return UsrDeviceType_USR_DEVICE_TYPE_DEVICE_TYPE_UNSPECIFIED
}

func (x *UsrDevice) GetState() UsrDeviceState {
	if x != nil {
		return x.State
	}
	return UsrDeviceState_USR_DEVICE_STATE_UNSPECIFIED
}

func (x *UsrDevice) GetToken() string {
	if x != nil && x.Token != nil {
		return *x.Token
	}
	return ""
}

func (x *UsrDevice) GetOwner() uint32 {
	if x != nil {
		return x.Owner
	}
	return 0
}

// Representació d'una llista de dispositius.
type UsrDevicesList struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Elms []*UsrDevice `protobuf:"bytes,1,rep,name=elms,proto3" json:"elms,omitempty"`
}

func (x *UsrDevicesList) Reset() {
	*x = UsrDevicesList{}
	if protoimpl.UnsafeEnabled {
		mi := &file_usrmod_usr_device_proto_msgTypes[1]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *UsrDevicesList) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*UsrDevicesList) ProtoMessage() {}

func (x *UsrDevicesList) ProtoReflect() protoreflect.Message {
	mi := &file_usrmod_usr_device_proto_msgTypes[1]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use UsrDevicesList.ProtoReflect.Descriptor instead.
func (*UsrDevicesList) Descriptor() ([]byte, []int) {
	return file_usrmod_usr_device_proto_rawDescGZIP(), []int{1}
}

func (x *UsrDevicesList) GetElms() []*UsrDevice {
	if x != nil {
		return x.Elms
	}
	return nil
}

var File_usrmod_usr_device_proto protoreflect.FileDescriptor

var file_usrmod_usr_device_proto_rawDesc = []byte{
	0x0a, 0x17, 0x75, 0x73, 0x72, 0x6d, 0x6f, 0x64, 0x2f, 0x75, 0x73, 0x72, 0x5f, 0x64, 0x65, 0x76,
	0x69, 0x63, 0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x12, 0x05, 0x70, 0x72, 0x6f, 0x74, 0x6f,
	0x1a, 0x11, 0x62, 0x61, 0x73, 0x65, 0x5f, 0x65, 0x6e, 0x74, 0x69, 0x74, 0x79, 0x2e, 0x70, 0x72,
	0x6f, 0x74, 0x6f, 0x22, 0xd1, 0x01, 0x0a, 0x09, 0x55, 0x73, 0x72, 0x44, 0x65, 0x76, 0x69, 0x63,
	0x65, 0x12, 0x32, 0x0a, 0x0b, 0x62, 0x61, 0x73, 0x65, 0x5f, 0x65, 0x6e, 0x74, 0x69, 0x74, 0x79,
	0x18, 0x01, 0x20, 0x01, 0x28, 0x0b, 0x32, 0x11, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x2e, 0x42,
	0x61, 0x73, 0x65, 0x45, 0x6e, 0x74, 0x69, 0x74, 0x79, 0x52, 0x0a, 0x62, 0x61, 0x73, 0x65, 0x45,
	0x6e, 0x74, 0x69, 0x74, 0x79, 0x12, 0x28, 0x0a, 0x04, 0x74, 0x79, 0x70, 0x65, 0x18, 0x02, 0x20,
	0x01, 0x28, 0x0e, 0x32, 0x14, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x2e, 0x55, 0x73, 0x72, 0x44,
	0x65, 0x76, 0x69, 0x63, 0x65, 0x54, 0x79, 0x70, 0x65, 0x52, 0x04, 0x74, 0x79, 0x70, 0x65, 0x12,
	0x2b, 0x0a, 0x05, 0x73, 0x74, 0x61, 0x74, 0x65, 0x18, 0x03, 0x20, 0x01, 0x28, 0x0e, 0x32, 0x15,
	0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x2e, 0x55, 0x73, 0x72, 0x44, 0x65, 0x76, 0x69, 0x63, 0x65,
	0x53, 0x74, 0x61, 0x74, 0x65, 0x52, 0x05, 0x73, 0x74, 0x61, 0x74, 0x65, 0x12, 0x19, 0x0a, 0x05,
	0x74, 0x6f, 0x6b, 0x65, 0x6e, 0x18, 0x04, 0x20, 0x01, 0x28, 0x09, 0x48, 0x00, 0x52, 0x05, 0x74,
	0x6f, 0x6b, 0x65, 0x6e, 0x88, 0x01, 0x01, 0x12, 0x14, 0x0a, 0x05, 0x6f, 0x77, 0x6e, 0x65, 0x72,
	0x18, 0x05, 0x20, 0x01, 0x28, 0x0d, 0x52, 0x05, 0x6f, 0x77, 0x6e, 0x65, 0x72, 0x42, 0x08, 0x0a,
	0x06, 0x5f, 0x74, 0x6f, 0x6b, 0x65, 0x6e, 0x22, 0x36, 0x0a, 0x0e, 0x55, 0x73, 0x72, 0x44, 0x65,
	0x76, 0x69, 0x63, 0x65, 0x73, 0x4c, 0x69, 0x73, 0x74, 0x12, 0x24, 0x0a, 0x04, 0x65, 0x6c, 0x6d,
	0x73, 0x18, 0x01, 0x20, 0x03, 0x28, 0x0b, 0x32, 0x10, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x2e,
	0x55, 0x73, 0x72, 0x44, 0x65, 0x76, 0x69, 0x63, 0x65, 0x52, 0x04, 0x65, 0x6c, 0x6d, 0x73, 0x2a,
	0x97, 0x02, 0x0a, 0x0d, 0x55, 0x73, 0x72, 0x44, 0x65, 0x76, 0x69, 0x63, 0x65, 0x54, 0x79, 0x70,
	0x65, 0x12, 0x2b, 0x0a, 0x27, 0x55, 0x53, 0x52, 0x5f, 0x44, 0x45, 0x56, 0x49, 0x43, 0x45, 0x5f,
	0x54, 0x59, 0x50, 0x45, 0x5f, 0x44, 0x45, 0x56, 0x49, 0x43, 0x45, 0x5f, 0x54, 0x59, 0x50, 0x45,
	0x5f, 0x55, 0x4e, 0x53, 0x50, 0x45, 0x43, 0x49, 0x46, 0x49, 0x45, 0x44, 0x10, 0x00, 0x12, 0x22,
	0x0a, 0x1e, 0x55, 0x53, 0x52, 0x5f, 0x44, 0x45, 0x56, 0x49, 0x43, 0x45, 0x5f, 0x54, 0x59, 0x50,
	0x45, 0x5f, 0x41, 0x4e, 0x44, 0x52, 0x4f, 0x49, 0x44, 0x5f, 0x4d, 0x4f, 0x42, 0x49, 0x4c, 0x45,
	0x10, 0x01, 0x12, 0x22, 0x0a, 0x1e, 0x55, 0x53, 0x52, 0x5f, 0x44, 0x45, 0x56, 0x49, 0x43, 0x45,
	0x5f, 0x54, 0x59, 0x50, 0x45, 0x5f, 0x41, 0x4e, 0x44, 0x52, 0x4f, 0x49, 0x44, 0x5f, 0x54, 0x41,
	0x42, 0x4c, 0x45, 0x54, 0x10, 0x02, 0x12, 0x1e, 0x0a, 0x1a, 0x55, 0x53, 0x52, 0x5f, 0x44, 0x45,
	0x56, 0x49, 0x43, 0x45, 0x5f, 0x54, 0x59, 0x50, 0x45, 0x5f, 0x49, 0x4f, 0x53, 0x5f, 0x4d, 0x4f,
	0x42, 0x49, 0x4c, 0x45, 0x10, 0x03, 0x12, 0x1e, 0x0a, 0x1a, 0x55, 0x53, 0x52, 0x5f, 0x44, 0x45,
	0x56, 0x49, 0x43, 0x45, 0x5f, 0x54, 0x59, 0x50, 0x45, 0x5f, 0x49, 0x4f, 0x53, 0x5f, 0x54, 0x41,
	0x42, 0x4c, 0x45, 0x54, 0x10, 0x04, 0x12, 0x1b, 0x0a, 0x17, 0x55, 0x53, 0x52, 0x5f, 0x44, 0x45,
	0x56, 0x49, 0x43, 0x45, 0x5f, 0x54, 0x59, 0x50, 0x45, 0x5f, 0x57, 0x49, 0x4e, 0x44, 0x4f, 0x57,
	0x53, 0x10, 0x05, 0x12, 0x19, 0x0a, 0x15, 0x55, 0x53, 0x52, 0x5f, 0x44, 0x45, 0x56, 0x49, 0x43,
	0x45, 0x5f, 0x54, 0x59, 0x50, 0x45, 0x5f, 0x4d, 0x41, 0x43, 0x4f, 0x53, 0x10, 0x06, 0x12, 0x19,
	0x0a, 0x15, 0x55, 0x53, 0x52, 0x5f, 0x44, 0x45, 0x56, 0x49, 0x43, 0x45, 0x5f, 0x54, 0x59, 0x50,
	0x45, 0x5f, 0x4c, 0x49, 0x4e, 0x55, 0x58, 0x10, 0x07, 0x2a, 0x6f, 0x0a, 0x0e, 0x55, 0x73, 0x72,
	0x44, 0x65, 0x76, 0x69, 0x63, 0x65, 0x53, 0x74, 0x61, 0x74, 0x65, 0x12, 0x20, 0x0a, 0x1c, 0x55,
	0x53, 0x52, 0x5f, 0x44, 0x45, 0x56, 0x49, 0x43, 0x45, 0x5f, 0x53, 0x54, 0x41, 0x54, 0x45, 0x5f,
	0x55, 0x4e, 0x53, 0x50, 0x45, 0x43, 0x49, 0x46, 0x49, 0x45, 0x44, 0x10, 0x00, 0x12, 0x1c, 0x0a,
	0x18, 0x55, 0x53, 0x52, 0x5f, 0x44, 0x45, 0x56, 0x49, 0x43, 0x45, 0x5f, 0x53, 0x54, 0x41, 0x54,
	0x45, 0x5f, 0x45, 0x4e, 0x41, 0x42, 0x4c, 0x45, 0x44, 0x10, 0x01, 0x12, 0x1d, 0x0a, 0x19, 0x55,
	0x53, 0x52, 0x5f, 0x44, 0x45, 0x56, 0x49, 0x43, 0x45, 0x5f, 0x53, 0x54, 0x41, 0x54, 0x45, 0x5f,
	0x44, 0x49, 0x53, 0x41, 0x42, 0x4c, 0x45, 0x44, 0x10, 0x02, 0x42, 0x04, 0x5a, 0x02, 0x2e, 0x2f,
	0x62, 0x06, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x33,
}

var (
	file_usrmod_usr_device_proto_rawDescOnce sync.Once
	file_usrmod_usr_device_proto_rawDescData = file_usrmod_usr_device_proto_rawDesc
)

func file_usrmod_usr_device_proto_rawDescGZIP() []byte {
	file_usrmod_usr_device_proto_rawDescOnce.Do(func() {
		file_usrmod_usr_device_proto_rawDescData = protoimpl.X.CompressGZIP(file_usrmod_usr_device_proto_rawDescData)
	})
	return file_usrmod_usr_device_proto_rawDescData
}

var file_usrmod_usr_device_proto_enumTypes = make([]protoimpl.EnumInfo, 2)
var file_usrmod_usr_device_proto_msgTypes = make([]protoimpl.MessageInfo, 2)
var file_usrmod_usr_device_proto_goTypes = []interface{}{
	(UsrDeviceType)(0),     // 0: proto.UsrDeviceType
	(UsrDeviceState)(0),    // 1: proto.UsrDeviceState
	(*UsrDevice)(nil),      // 2: proto.UsrDevice
	(*UsrDevicesList)(nil), // 3: proto.UsrDevicesList
	(*BaseEntity)(nil),     // 4: proto.BaseEntity
}
var file_usrmod_usr_device_proto_depIdxs = []int32{
	4, // 0: proto.UsrDevice.base_entity:type_name -> proto.BaseEntity
	0, // 1: proto.UsrDevice.type:type_name -> proto.UsrDeviceType
	1, // 2: proto.UsrDevice.state:type_name -> proto.UsrDeviceState
	2, // 3: proto.UsrDevicesList.elms:type_name -> proto.UsrDevice
	4, // [4:4] is the sub-list for method output_type
	4, // [4:4] is the sub-list for method input_type
	4, // [4:4] is the sub-list for extension type_name
	4, // [4:4] is the sub-list for extension extendee
	0, // [0:4] is the sub-list for field type_name
}

func init() { file_usrmod_usr_device_proto_init() }
func file_usrmod_usr_device_proto_init() {
	if File_usrmod_usr_device_proto != nil {
		return
	}
	file_base_entity_proto_init()
	if !protoimpl.UnsafeEnabled {
		file_usrmod_usr_device_proto_msgTypes[0].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*UsrDevice); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_usrmod_usr_device_proto_msgTypes[1].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*UsrDevicesList); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
	}
	file_usrmod_usr_device_proto_msgTypes[0].OneofWrappers = []interface{}{}
	type x struct{}
	out := protoimpl.TypeBuilder{
		File: protoimpl.DescBuilder{
			GoPackagePath: reflect.TypeOf(x{}).PkgPath(),
			RawDescriptor: file_usrmod_usr_device_proto_rawDesc,
			NumEnums:      2,
			NumMessages:   2,
			NumExtensions: 0,
			NumServices:   0,
		},
		GoTypes:           file_usrmod_usr_device_proto_goTypes,
		DependencyIndexes: file_usrmod_usr_device_proto_depIdxs,
		EnumInfos:         file_usrmod_usr_device_proto_enumTypes,
		MessageInfos:      file_usrmod_usr_device_proto_msgTypes,
	}.Build()
	File_usrmod_usr_device_proto = out.File
	file_usrmod_usr_device_proto_rawDesc = nil
	file_usrmod_usr_device_proto_goTypes = nil
	file_usrmod_usr_device_proto_depIdxs = nil
}
