// Fitxer de definició proto de les categories dels tests.
// createdAt: 24/09/26 dj. JIQ

// Code generated by protoc-gen-go. DO NOT EDIT.
// versions:
// 	protoc-gen-go v1.34.2
// 	protoc        v5.28.2
// source: tstmod/tst_test_category.proto

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

// Definició de les catergories de tests.
type TstTestCategory struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	BaseEntity *ModelEntity     `protobuf:"bytes,1,opt,name=base_entity,json=baseEntity,proto3" json:"base_entity,omitempty"`
	TitleKey   string           `protobuf:"bytes,2,opt,name=title_key,json=titleKey,proto3" json:"title_key,omitempty"`
	DescKey    *string          `protobuf:"bytes,3,opt,name=desc_key,json=descKey,proto3,oneof" json:"desc_key,omitempty"`
	Parent     *TstTestCategory `protobuf:"bytes,4,opt,name=parent,proto3,oneof" json:"parent,omitempty"`
}

func (x *TstTestCategory) Reset() {
	*x = TstTestCategory{}
	if protoimpl.UnsafeEnabled {
		mi := &file_tstmod_tst_test_category_proto_msgTypes[0]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *TstTestCategory) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*TstTestCategory) ProtoMessage() {}

func (x *TstTestCategory) ProtoReflect() protoreflect.Message {
	mi := &file_tstmod_tst_test_category_proto_msgTypes[0]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use TstTestCategory.ProtoReflect.Descriptor instead.
func (*TstTestCategory) Descriptor() ([]byte, []int) {
	return file_tstmod_tst_test_category_proto_rawDescGZIP(), []int{0}
}

func (x *TstTestCategory) GetBaseEntity() *ModelEntity {
	if x != nil {
		return x.BaseEntity
	}
	return nil
}

func (x *TstTestCategory) GetTitleKey() string {
	if x != nil {
		return x.TitleKey
	}
	return ""
}

func (x *TstTestCategory) GetDescKey() string {
	if x != nil && x.DescKey != nil {
		return *x.DescKey
	}
	return ""
}

func (x *TstTestCategory) GetParent() *TstTestCategory {
	if x != nil {
		return x.Parent
	}
	return nil
}

var File_tstmod_tst_test_category_proto protoreflect.FileDescriptor

var file_tstmod_tst_test_category_proto_rawDesc = []byte{
	0x0a, 0x1e, 0x74, 0x73, 0x74, 0x6d, 0x6f, 0x64, 0x2f, 0x74, 0x73, 0x74, 0x5f, 0x74, 0x65, 0x73,
	0x74, 0x5f, 0x63, 0x61, 0x74, 0x65, 0x67, 0x6f, 0x72, 0x79, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f,
	0x12, 0x05, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x1a, 0x12, 0x6d, 0x6f, 0x64, 0x65, 0x6c, 0x5f, 0x65,
	0x6e, 0x74, 0x69, 0x74, 0x79, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x22, 0xd0, 0x01, 0x0a, 0x0f,
	0x54, 0x73, 0x74, 0x54, 0x65, 0x73, 0x74, 0x43, 0x61, 0x74, 0x65, 0x67, 0x6f, 0x72, 0x79, 0x12,
	0x33, 0x0a, 0x0b, 0x62, 0x61, 0x73, 0x65, 0x5f, 0x65, 0x6e, 0x74, 0x69, 0x74, 0x79, 0x18, 0x01,
	0x20, 0x01, 0x28, 0x0b, 0x32, 0x12, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x2e, 0x4d, 0x6f, 0x64,
	0x65, 0x6c, 0x45, 0x6e, 0x74, 0x69, 0x74, 0x79, 0x52, 0x0a, 0x62, 0x61, 0x73, 0x65, 0x45, 0x6e,
	0x74, 0x69, 0x74, 0x79, 0x12, 0x1b, 0x0a, 0x09, 0x74, 0x69, 0x74, 0x6c, 0x65, 0x5f, 0x6b, 0x65,
	0x79, 0x18, 0x02, 0x20, 0x01, 0x28, 0x09, 0x52, 0x08, 0x74, 0x69, 0x74, 0x6c, 0x65, 0x4b, 0x65,
	0x79, 0x12, 0x1e, 0x0a, 0x08, 0x64, 0x65, 0x73, 0x63, 0x5f, 0x6b, 0x65, 0x79, 0x18, 0x03, 0x20,
	0x01, 0x28, 0x09, 0x48, 0x00, 0x52, 0x07, 0x64, 0x65, 0x73, 0x63, 0x4b, 0x65, 0x79, 0x88, 0x01,
	0x01, 0x12, 0x33, 0x0a, 0x06, 0x70, 0x61, 0x72, 0x65, 0x6e, 0x74, 0x18, 0x04, 0x20, 0x01, 0x28,
	0x0b, 0x32, 0x16, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x2e, 0x54, 0x73, 0x74, 0x54, 0x65, 0x73,
	0x74, 0x43, 0x61, 0x74, 0x65, 0x67, 0x6f, 0x72, 0x79, 0x48, 0x01, 0x52, 0x06, 0x70, 0x61, 0x72,
	0x65, 0x6e, 0x74, 0x88, 0x01, 0x01, 0x42, 0x0b, 0x0a, 0x09, 0x5f, 0x64, 0x65, 0x73, 0x63, 0x5f,
	0x6b, 0x65, 0x79, 0x42, 0x09, 0x0a, 0x07, 0x5f, 0x70, 0x61, 0x72, 0x65, 0x6e, 0x74, 0x42, 0x04,
	0x5a, 0x02, 0x2e, 0x2f, 0x62, 0x06, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x33,
}

var (
	file_tstmod_tst_test_category_proto_rawDescOnce sync.Once
	file_tstmod_tst_test_category_proto_rawDescData = file_tstmod_tst_test_category_proto_rawDesc
)

func file_tstmod_tst_test_category_proto_rawDescGZIP() []byte {
	file_tstmod_tst_test_category_proto_rawDescOnce.Do(func() {
		file_tstmod_tst_test_category_proto_rawDescData = protoimpl.X.CompressGZIP(file_tstmod_tst_test_category_proto_rawDescData)
	})
	return file_tstmod_tst_test_category_proto_rawDescData
}

var file_tstmod_tst_test_category_proto_msgTypes = make([]protoimpl.MessageInfo, 1)
var file_tstmod_tst_test_category_proto_goTypes = []any{
	(*TstTestCategory)(nil), // 0: proto.TstTestCategory
	(*ModelEntity)(nil),     // 1: proto.ModelEntity
}
var file_tstmod_tst_test_category_proto_depIdxs = []int32{
	1, // 0: proto.TstTestCategory.base_entity:type_name -> proto.ModelEntity
	0, // 1: proto.TstTestCategory.parent:type_name -> proto.TstTestCategory
	2, // [2:2] is the sub-list for method output_type
	2, // [2:2] is the sub-list for method input_type
	2, // [2:2] is the sub-list for extension type_name
	2, // [2:2] is the sub-list for extension extendee
	0, // [0:2] is the sub-list for field type_name
}

func init() { file_tstmod_tst_test_category_proto_init() }
func file_tstmod_tst_test_category_proto_init() {
	if File_tstmod_tst_test_category_proto != nil {
		return
	}
	file_model_entity_proto_init()
	if !protoimpl.UnsafeEnabled {
		file_tstmod_tst_test_category_proto_msgTypes[0].Exporter = func(v any, i int) any {
			switch v := v.(*TstTestCategory); i {
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
	file_tstmod_tst_test_category_proto_msgTypes[0].OneofWrappers = []any{}
	type x struct{}
	out := protoimpl.TypeBuilder{
		File: protoimpl.DescBuilder{
			GoPackagePath: reflect.TypeOf(x{}).PkgPath(),
			RawDescriptor: file_tstmod_tst_test_category_proto_rawDesc,
			NumEnums:      0,
			NumMessages:   1,
			NumExtensions: 0,
			NumServices:   0,
		},
		GoTypes:           file_tstmod_tst_test_category_proto_goTypes,
		DependencyIndexes: file_tstmod_tst_test_category_proto_depIdxs,
		MessageInfos:      file_tstmod_tst_test_category_proto_msgTypes,
	}.Build()
	File_tstmod_tst_test_category_proto = out.File
	file_tstmod_tst_test_category_proto_rawDesc = nil
	file_tstmod_tst_test_category_proto_goTypes = nil
	file_tstmod_tst_test_category_proto_depIdxs = nil
}
