// Fitxer de definició de les enumeracions proto GLOBALs.

// Code generated by protoc-gen-go. DO NOT EDIT.
// versions:
// 	protoc-gen-go v1.34.2
// 	protoc        v5.28.2
// source: gbl_enumerations.proto

package __

import (
	protoreflect "google.golang.org/protobuf/reflect/protoreflect"
	protoimpl "google.golang.org/protobuf/runtime/protoimpl"
	reflect "reflect"
	sync "sync"
)

const (
	// Verify that this generated code is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(20 - protoimpl.MinVersion)
	// Verify that runtime/protoimpl is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(protoimpl.MaxVersion - 20)
)

// Enumeració dels errors generals que poden aparèixer.
type GbErrorCode int32

const (
	GbErrorCode_GB_ERROR_CODE_UNSPECIFIED           GbErrorCode = 0
	GbErrorCode_GB_ERROR_CODE_SUCCESS               GbErrorCode = 1
	GbErrorCode_GB_ERROR_CODE_CUSTOM                GbErrorCode = 2
	GbErrorCode_GB_ERROR_CODE_UNKNOWN               GbErrorCode = 3
	GbErrorCode_GB_ERROR_CODE_INTERNAL_SERVER_ERROR GbErrorCode = 4
	GbErrorCode_GB_ERROR_CODE_SERVICE_UNAVAILABLE   GbErrorCode = 5
	GbErrorCode_GB_ERROR_CODE_SQL_ERROR             GbErrorCode = 6
)

// Enum value maps for GbErrorCode.
var (
	GbErrorCode_name = map[int32]string{
		0: "GB_ERROR_CODE_UNSPECIFIED",
		1: "GB_ERROR_CODE_SUCCESS",
		2: "GB_ERROR_CODE_CUSTOM",
		3: "GB_ERROR_CODE_UNKNOWN",
		4: "GB_ERROR_CODE_INTERNAL_SERVER_ERROR",
		5: "GB_ERROR_CODE_SERVICE_UNAVAILABLE",
		6: "GB_ERROR_CODE_SQL_ERROR",
	}
	GbErrorCode_value = map[string]int32{
		"GB_ERROR_CODE_UNSPECIFIED":           0,
		"GB_ERROR_CODE_SUCCESS":               1,
		"GB_ERROR_CODE_CUSTOM":                2,
		"GB_ERROR_CODE_UNKNOWN":               3,
		"GB_ERROR_CODE_INTERNAL_SERVER_ERROR": 4,
		"GB_ERROR_CODE_SERVICE_UNAVAILABLE":   5,
		"GB_ERROR_CODE_SQL_ERROR":             6,
	}
)

func (x GbErrorCode) Enum() *GbErrorCode {
	p := new(GbErrorCode)
	*p = x
	return p
}

func (x GbErrorCode) String() string {
	return protoimpl.X.EnumStringOf(x.Descriptor(), protoreflect.EnumNumber(x))
}

func (GbErrorCode) Descriptor() protoreflect.EnumDescriptor {
	return file_gbl_enumerations_proto_enumTypes[0].Descriptor()
}

func (GbErrorCode) Type() protoreflect.EnumType {
	return &file_gbl_enumerations_proto_enumTypes[0]
}

func (x GbErrorCode) Number() protoreflect.EnumNumber {
	return protoreflect.EnumNumber(x)
}

// Deprecated: Use GbErrorCode.Descriptor instead.
func (GbErrorCode) EnumDescriptor() ([]byte, []int) {
	return file_gbl_enumerations_proto_rawDescGZIP(), []int{0}
}

// Enumeració de les accions sobre instàncies d'entitat.
type GbEntityAction int32

const (
	GbEntityAction_GB_ENTITY_ACTION_UNSPECIFIED GbEntityAction = 0
	GbEntityAction_GB_ENTITY_ACTION_CREATE      GbEntityAction = 1
	GbEntityAction_GB_ENTITY_ACTION_MODIFY      GbEntityAction = 2
	GbEntityAction_GB_ENTITY_ACTION_FIND        GbEntityAction = 3
	GbEntityAction_GB_ENTITY_ACTION_SYNC        GbEntityAction = 4
	GbEntityAction_GB_ENTITY_ACTION_LOCK        GbEntityAction = 5
	GbEntityAction_GB_ENTITY_ACTION_DELETE      GbEntityAction = 6
)

// Enum value maps for GbEntityAction.
var (
	GbEntityAction_name = map[int32]string{
		0: "GB_ENTITY_ACTION_UNSPECIFIED",
		1: "GB_ENTITY_ACTION_CREATE",
		2: "GB_ENTITY_ACTION_MODIFY",
		3: "GB_ENTITY_ACTION_FIND",
		4: "GB_ENTITY_ACTION_SYNC",
		5: "GB_ENTITY_ACTION_LOCK",
		6: "GB_ENTITY_ACTION_DELETE",
	}
	GbEntityAction_value = map[string]int32{
		"GB_ENTITY_ACTION_UNSPECIFIED": 0,
		"GB_ENTITY_ACTION_CREATE":      1,
		"GB_ENTITY_ACTION_MODIFY":      2,
		"GB_ENTITY_ACTION_FIND":        3,
		"GB_ENTITY_ACTION_SYNC":        4,
		"GB_ENTITY_ACTION_LOCK":        5,
		"GB_ENTITY_ACTION_DELETE":      6,
	}
)

func (x GbEntityAction) Enum() *GbEntityAction {
	p := new(GbEntityAction)
	*p = x
	return p
}

func (x GbEntityAction) String() string {
	return protoimpl.X.EnumStringOf(x.Descriptor(), protoreflect.EnumNumber(x))
}

func (GbEntityAction) Descriptor() protoreflect.EnumDescriptor {
	return file_gbl_enumerations_proto_enumTypes[1].Descriptor()
}

func (GbEntityAction) Type() protoreflect.EnumType {
	return &file_gbl_enumerations_proto_enumTypes[1]
}

func (x GbEntityAction) Number() protoreflect.EnumNumber {
	return protoreflect.EnumNumber(x)
}

// Deprecated: Use GbEntityAction.Descriptor instead.
func (GbEntityAction) EnumDescriptor() ([]byte, []int) {
	return file_gbl_enumerations_proto_rawDescGZIP(), []int{1}
}

// Tipus d'acció de sincronització cap al backend.
type GbSyncAction int32

const (
	GbSyncAction_GB_SYNC_ACTION_SYNC_UNSPECIFIED GbSyncAction = 0
	GbSyncAction_GB_SYNC_ACTION_SYNC_CREATE      GbSyncAction = 1
	GbSyncAction_GB_SYNC_ACTION_SYNC_UPDATE      GbSyncAction = 2
	GbSyncAction_GB_SYNC_ACTION_SYNC_DELETE      GbSyncAction = 3
)

// Enum value maps for GbSyncAction.
var (
	GbSyncAction_name = map[int32]string{
		0: "GB_SYNC_ACTION_SYNC_UNSPECIFIED",
		1: "GB_SYNC_ACTION_SYNC_CREATE",
		2: "GB_SYNC_ACTION_SYNC_UPDATE",
		3: "GB_SYNC_ACTION_SYNC_DELETE",
	}
	GbSyncAction_value = map[string]int32{
		"GB_SYNC_ACTION_SYNC_UNSPECIFIED": 0,
		"GB_SYNC_ACTION_SYNC_CREATE":      1,
		"GB_SYNC_ACTION_SYNC_UPDATE":      2,
		"GB_SYNC_ACTION_SYNC_DELETE":      3,
	}
)

func (x GbSyncAction) Enum() *GbSyncAction {
	p := new(GbSyncAction)
	*p = x
	return p
}

func (x GbSyncAction) String() string {
	return protoimpl.X.EnumStringOf(x.Descriptor(), protoreflect.EnumNumber(x))
}

func (GbSyncAction) Descriptor() protoreflect.EnumDescriptor {
	return file_gbl_enumerations_proto_enumTypes[2].Descriptor()
}

func (GbSyncAction) Type() protoreflect.EnumType {
	return &file_gbl_enumerations_proto_enumTypes[2]
}

func (x GbSyncAction) Number() protoreflect.EnumNumber {
	return protoreflect.EnumNumber(x)
}

// Deprecated: Use GbSyncAction.Descriptor instead.
func (GbSyncAction) EnumDescriptor() ([]byte, []int) {
	return file_gbl_enumerations_proto_rawDescGZIP(), []int{2}
}

var File_gbl_enumerations_proto protoreflect.FileDescriptor

var file_gbl_enumerations_proto_rawDesc = []byte{
	0x0a, 0x16, 0x67, 0x62, 0x6c, 0x5f, 0x65, 0x6e, 0x75, 0x6d, 0x65, 0x72, 0x61, 0x74, 0x69, 0x6f,
	0x6e, 0x73, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x12, 0x05, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x2a,
	0xe9, 0x01, 0x0a, 0x0b, 0x47, 0x62, 0x45, 0x72, 0x72, 0x6f, 0x72, 0x43, 0x6f, 0x64, 0x65, 0x12,
	0x1d, 0x0a, 0x19, 0x47, 0x42, 0x5f, 0x45, 0x52, 0x52, 0x4f, 0x52, 0x5f, 0x43, 0x4f, 0x44, 0x45,
	0x5f, 0x55, 0x4e, 0x53, 0x50, 0x45, 0x43, 0x49, 0x46, 0x49, 0x45, 0x44, 0x10, 0x00, 0x12, 0x19,
	0x0a, 0x15, 0x47, 0x42, 0x5f, 0x45, 0x52, 0x52, 0x4f, 0x52, 0x5f, 0x43, 0x4f, 0x44, 0x45, 0x5f,
	0x53, 0x55, 0x43, 0x43, 0x45, 0x53, 0x53, 0x10, 0x01, 0x12, 0x18, 0x0a, 0x14, 0x47, 0x42, 0x5f,
	0x45, 0x52, 0x52, 0x4f, 0x52, 0x5f, 0x43, 0x4f, 0x44, 0x45, 0x5f, 0x43, 0x55, 0x53, 0x54, 0x4f,
	0x4d, 0x10, 0x02, 0x12, 0x19, 0x0a, 0x15, 0x47, 0x42, 0x5f, 0x45, 0x52, 0x52, 0x4f, 0x52, 0x5f,
	0x43, 0x4f, 0x44, 0x45, 0x5f, 0x55, 0x4e, 0x4b, 0x4e, 0x4f, 0x57, 0x4e, 0x10, 0x03, 0x12, 0x27,
	0x0a, 0x23, 0x47, 0x42, 0x5f, 0x45, 0x52, 0x52, 0x4f, 0x52, 0x5f, 0x43, 0x4f, 0x44, 0x45, 0x5f,
	0x49, 0x4e, 0x54, 0x45, 0x52, 0x4e, 0x41, 0x4c, 0x5f, 0x53, 0x45, 0x52, 0x56, 0x45, 0x52, 0x5f,
	0x45, 0x52, 0x52, 0x4f, 0x52, 0x10, 0x04, 0x12, 0x25, 0x0a, 0x21, 0x47, 0x42, 0x5f, 0x45, 0x52,
	0x52, 0x4f, 0x52, 0x5f, 0x43, 0x4f, 0x44, 0x45, 0x5f, 0x53, 0x45, 0x52, 0x56, 0x49, 0x43, 0x45,
	0x5f, 0x55, 0x4e, 0x41, 0x56, 0x41, 0x49, 0x4c, 0x41, 0x42, 0x4c, 0x45, 0x10, 0x05, 0x12, 0x1b,
	0x0a, 0x17, 0x47, 0x42, 0x5f, 0x45, 0x52, 0x52, 0x4f, 0x52, 0x5f, 0x43, 0x4f, 0x44, 0x45, 0x5f,
	0x53, 0x51, 0x4c, 0x5f, 0x45, 0x52, 0x52, 0x4f, 0x52, 0x10, 0x06, 0x2a, 0xda, 0x01, 0x0a, 0x0e,
	0x47, 0x62, 0x45, 0x6e, 0x74, 0x69, 0x74, 0x79, 0x41, 0x63, 0x74, 0x69, 0x6f, 0x6e, 0x12, 0x20,
	0x0a, 0x1c, 0x47, 0x42, 0x5f, 0x45, 0x4e, 0x54, 0x49, 0x54, 0x59, 0x5f, 0x41, 0x43, 0x54, 0x49,
	0x4f, 0x4e, 0x5f, 0x55, 0x4e, 0x53, 0x50, 0x45, 0x43, 0x49, 0x46, 0x49, 0x45, 0x44, 0x10, 0x00,
	0x12, 0x1b, 0x0a, 0x17, 0x47, 0x42, 0x5f, 0x45, 0x4e, 0x54, 0x49, 0x54, 0x59, 0x5f, 0x41, 0x43,
	0x54, 0x49, 0x4f, 0x4e, 0x5f, 0x43, 0x52, 0x45, 0x41, 0x54, 0x45, 0x10, 0x01, 0x12, 0x1b, 0x0a,
	0x17, 0x47, 0x42, 0x5f, 0x45, 0x4e, 0x54, 0x49, 0x54, 0x59, 0x5f, 0x41, 0x43, 0x54, 0x49, 0x4f,
	0x4e, 0x5f, 0x4d, 0x4f, 0x44, 0x49, 0x46, 0x59, 0x10, 0x02, 0x12, 0x19, 0x0a, 0x15, 0x47, 0x42,
	0x5f, 0x45, 0x4e, 0x54, 0x49, 0x54, 0x59, 0x5f, 0x41, 0x43, 0x54, 0x49, 0x4f, 0x4e, 0x5f, 0x46,
	0x49, 0x4e, 0x44, 0x10, 0x03, 0x12, 0x19, 0x0a, 0x15, 0x47, 0x42, 0x5f, 0x45, 0x4e, 0x54, 0x49,
	0x54, 0x59, 0x5f, 0x41, 0x43, 0x54, 0x49, 0x4f, 0x4e, 0x5f, 0x53, 0x59, 0x4e, 0x43, 0x10, 0x04,
	0x12, 0x19, 0x0a, 0x15, 0x47, 0x42, 0x5f, 0x45, 0x4e, 0x54, 0x49, 0x54, 0x59, 0x5f, 0x41, 0x43,
	0x54, 0x49, 0x4f, 0x4e, 0x5f, 0x4c, 0x4f, 0x43, 0x4b, 0x10, 0x05, 0x12, 0x1b, 0x0a, 0x17, 0x47,
	0x42, 0x5f, 0x45, 0x4e, 0x54, 0x49, 0x54, 0x59, 0x5f, 0x41, 0x43, 0x54, 0x49, 0x4f, 0x4e, 0x5f,
	0x44, 0x45, 0x4c, 0x45, 0x54, 0x45, 0x10, 0x06, 0x2a, 0x93, 0x01, 0x0a, 0x0c, 0x47, 0x62, 0x53,
	0x79, 0x6e, 0x63, 0x41, 0x63, 0x74, 0x69, 0x6f, 0x6e, 0x12, 0x23, 0x0a, 0x1f, 0x47, 0x42, 0x5f,
	0x53, 0x59, 0x4e, 0x43, 0x5f, 0x41, 0x43, 0x54, 0x49, 0x4f, 0x4e, 0x5f, 0x53, 0x59, 0x4e, 0x43,
	0x5f, 0x55, 0x4e, 0x53, 0x50, 0x45, 0x43, 0x49, 0x46, 0x49, 0x45, 0x44, 0x10, 0x00, 0x12, 0x1e,
	0x0a, 0x1a, 0x47, 0x42, 0x5f, 0x53, 0x59, 0x4e, 0x43, 0x5f, 0x41, 0x43, 0x54, 0x49, 0x4f, 0x4e,
	0x5f, 0x53, 0x59, 0x4e, 0x43, 0x5f, 0x43, 0x52, 0x45, 0x41, 0x54, 0x45, 0x10, 0x01, 0x12, 0x1e,
	0x0a, 0x1a, 0x47, 0x42, 0x5f, 0x53, 0x59, 0x4e, 0x43, 0x5f, 0x41, 0x43, 0x54, 0x49, 0x4f, 0x4e,
	0x5f, 0x53, 0x59, 0x4e, 0x43, 0x5f, 0x55, 0x50, 0x44, 0x41, 0x54, 0x45, 0x10, 0x02, 0x12, 0x1e,
	0x0a, 0x1a, 0x47, 0x42, 0x5f, 0x53, 0x59, 0x4e, 0x43, 0x5f, 0x41, 0x43, 0x54, 0x49, 0x4f, 0x4e,
	0x5f, 0x53, 0x59, 0x4e, 0x43, 0x5f, 0x44, 0x45, 0x4c, 0x45, 0x54, 0x45, 0x10, 0x03, 0x42, 0x04,
	0x5a, 0x02, 0x2e, 0x2f, 0x62, 0x06, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x33,
}

var (
	file_gbl_enumerations_proto_rawDescOnce sync.Once
	file_gbl_enumerations_proto_rawDescData = file_gbl_enumerations_proto_rawDesc
)

func file_gbl_enumerations_proto_rawDescGZIP() []byte {
	file_gbl_enumerations_proto_rawDescOnce.Do(func() {
		file_gbl_enumerations_proto_rawDescData = protoimpl.X.CompressGZIP(file_gbl_enumerations_proto_rawDescData)
	})
	return file_gbl_enumerations_proto_rawDescData
}

var file_gbl_enumerations_proto_enumTypes = make([]protoimpl.EnumInfo, 3)
var file_gbl_enumerations_proto_goTypes = []any{
	(GbErrorCode)(0),    // 0: proto.GbErrorCode
	(GbEntityAction)(0), // 1: proto.GbEntityAction
	(GbSyncAction)(0),   // 2: proto.GbSyncAction
}
var file_gbl_enumerations_proto_depIdxs = []int32{
	0, // [0:0] is the sub-list for method output_type
	0, // [0:0] is the sub-list for method input_type
	0, // [0:0] is the sub-list for extension type_name
	0, // [0:0] is the sub-list for extension extendee
	0, // [0:0] is the sub-list for field type_name
}

func init() { file_gbl_enumerations_proto_init() }
func file_gbl_enumerations_proto_init() {
	if File_gbl_enumerations_proto != nil {
		return
	}
	type x struct{}
	out := protoimpl.TypeBuilder{
		File: protoimpl.DescBuilder{
			GoPackagePath: reflect.TypeOf(x{}).PkgPath(),
			RawDescriptor: file_gbl_enumerations_proto_rawDesc,
			NumEnums:      3,
			NumMessages:   0,
			NumExtensions: 0,
			NumServices:   0,
		},
		GoTypes:           file_gbl_enumerations_proto_goTypes,
		DependencyIndexes: file_gbl_enumerations_proto_depIdxs,
		EnumInfos:         file_gbl_enumerations_proto_enumTypes,
	}.Build()
	File_gbl_enumerations_proto = out.File
	file_gbl_enumerations_proto_rawDesc = nil
	file_gbl_enumerations_proto_goTypes = nil
	file_gbl_enumerations_proto_depIdxs = nil
}
