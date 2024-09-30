// Fitxer de definició proto de les respostes als test d'avaluació.

// Code generated by protoc-gen-go. DO NOT EDIT.
// versions:
// 	protoc-gen-go v1.34.2
// 	protoc        v5.28.2
// source: resmod/res_answer.proto

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

// Resposta a les preguntes d'un test d'avaluació.
type ResAnswer struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	BaseEntity  *ModelEntity    `protobuf:"bytes,1,opt,name=base_entity,json=baseEntity,proto3" json:"base_entity,omitempty"`
	Test        *ResPatientTest `protobuf:"bytes,2,opt,name=test,proto3" json:"test,omitempty"`
	Question    *TstQuestion    `protobuf:"bytes,3,opt,name=question,proto3" json:"question,omitempty"`
	Answer      *string         `protobuf:"bytes,4,opt,name=answer,proto3,oneof" json:"answer,omitempty"`
	Option      *LstOptionEntry `protobuf:"bytes,5,opt,name=option,proto3,oneof" json:"option,omitempty"`
	Emotion     *EmoEmotion     `protobuf:"bytes,6,opt,name=emotion,proto3,oneof" json:"emotion,omitempty"`
	Mood        *EmoMood        `protobuf:"bytes,7,opt,name=mood,proto3,oneof" json:"mood,omitempty"`
	CompletedAt *Timestamp      `protobuf:"bytes,8,opt,name=completed_at,json=completedAt,proto3,oneof" json:"completed_at,omitempty"`
	EvaluatedBy *UsrUser        `protobuf:"bytes,9,opt,name=evaluated_by,json=evaluatedBy,proto3,oneof" json:"evaluated_by,omitempty"`
	EvaluatedAt *Timestamp      `protobuf:"bytes,10,opt,name=evaluated_at,json=evaluatedAt,proto3,oneof" json:"evaluated_at,omitempty"`
	Evaluation  *string         `protobuf:"bytes,11,opt,name=evaluation,proto3,oneof" json:"evaluation,omitempty"`
}

func (x *ResAnswer) Reset() {
	*x = ResAnswer{}
	if protoimpl.UnsafeEnabled {
		mi := &file_resmod_res_answer_proto_msgTypes[0]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *ResAnswer) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*ResAnswer) ProtoMessage() {}

func (x *ResAnswer) ProtoReflect() protoreflect.Message {
	mi := &file_resmod_res_answer_proto_msgTypes[0]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use ResAnswer.ProtoReflect.Descriptor instead.
func (*ResAnswer) Descriptor() ([]byte, []int) {
	return file_resmod_res_answer_proto_rawDescGZIP(), []int{0}
}

func (x *ResAnswer) GetBaseEntity() *ModelEntity {
	if x != nil {
		return x.BaseEntity
	}
	return nil
}

func (x *ResAnswer) GetTest() *ResPatientTest {
	if x != nil {
		return x.Test
	}
	return nil
}

func (x *ResAnswer) GetQuestion() *TstQuestion {
	if x != nil {
		return x.Question
	}
	return nil
}

func (x *ResAnswer) GetAnswer() string {
	if x != nil && x.Answer != nil {
		return *x.Answer
	}
	return ""
}

func (x *ResAnswer) GetOption() *LstOptionEntry {
	if x != nil {
		return x.Option
	}
	return nil
}

func (x *ResAnswer) GetEmotion() *EmoEmotion {
	if x != nil {
		return x.Emotion
	}
	return nil
}

func (x *ResAnswer) GetMood() *EmoMood {
	if x != nil {
		return x.Mood
	}
	return nil
}

func (x *ResAnswer) GetCompletedAt() *Timestamp {
	if x != nil {
		return x.CompletedAt
	}
	return nil
}

func (x *ResAnswer) GetEvaluatedBy() *UsrUser {
	if x != nil {
		return x.EvaluatedBy
	}
	return nil
}

func (x *ResAnswer) GetEvaluatedAt() *Timestamp {
	if x != nil {
		return x.EvaluatedAt
	}
	return nil
}

func (x *ResAnswer) GetEvaluation() string {
	if x != nil && x.Evaluation != nil {
		return *x.Evaluation
	}
	return ""
}

var File_resmod_res_answer_proto protoreflect.FileDescriptor

var file_resmod_res_answer_proto_rawDesc = []byte{
	0x0a, 0x17, 0x72, 0x65, 0x73, 0x6d, 0x6f, 0x64, 0x2f, 0x72, 0x65, 0x73, 0x5f, 0x61, 0x6e, 0x73,
	0x77, 0x65, 0x72, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x12, 0x05, 0x70, 0x72, 0x6f, 0x74, 0x6f,
	0x1a, 0x12, 0x6d, 0x6f, 0x64, 0x65, 0x6c, 0x5f, 0x65, 0x6e, 0x74, 0x69, 0x74, 0x79, 0x2e, 0x70,
	0x72, 0x6f, 0x74, 0x6f, 0x1a, 0x13, 0x67, 0x62, 0x6c, 0x5f, 0x74, 0x69, 0x6d, 0x65, 0x73, 0x74,
	0x61, 0x6d, 0x70, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x1a, 0x19, 0x65, 0x6d, 0x6f, 0x6d, 0x6f,
	0x64, 0x2f, 0x65, 0x6d, 0x6f, 0x5f, 0x65, 0x6e, 0x74, 0x69, 0x74, 0x69, 0x65, 0x73, 0x2e, 0x70,
	0x72, 0x6f, 0x74, 0x6f, 0x1a, 0x1d, 0x6c, 0x73, 0x74, 0x6d, 0x6f, 0x64, 0x2f, 0x6c, 0x73, 0x74,
	0x5f, 0x6f, 0x70, 0x74, 0x69, 0x6f, 0x6e, 0x5f, 0x65, 0x6e, 0x74, 0x72, 0x79, 0x2e, 0x70, 0x72,
	0x6f, 0x74, 0x6f, 0x1a, 0x1d, 0x72, 0x65, 0x73, 0x6d, 0x6f, 0x64, 0x2f, 0x72, 0x65, 0x73, 0x5f,
	0x70, 0x61, 0x74, 0x69, 0x65, 0x6e, 0x74, 0x5f, 0x74, 0x65, 0x73, 0x74, 0x2e, 0x70, 0x72, 0x6f,
	0x74, 0x6f, 0x1a, 0x19, 0x74, 0x73, 0x74, 0x6d, 0x6f, 0x64, 0x2f, 0x74, 0x73, 0x74, 0x5f, 0x71,
	0x75, 0x65, 0x73, 0x74, 0x69, 0x6f, 0x6e, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x1a, 0x15, 0x75,
	0x73, 0x72, 0x6d, 0x6f, 0x64, 0x2f, 0x75, 0x73, 0x72, 0x5f, 0x75, 0x73, 0x65, 0x72, 0x2e, 0x70,
	0x72, 0x6f, 0x74, 0x6f, 0x22, 0x85, 0x05, 0x0a, 0x09, 0x52, 0x65, 0x73, 0x41, 0x6e, 0x73, 0x77,
	0x65, 0x72, 0x12, 0x33, 0x0a, 0x0b, 0x62, 0x61, 0x73, 0x65, 0x5f, 0x65, 0x6e, 0x74, 0x69, 0x74,
	0x79, 0x18, 0x01, 0x20, 0x01, 0x28, 0x0b, 0x32, 0x12, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x2e,
	0x4d, 0x6f, 0x64, 0x65, 0x6c, 0x45, 0x6e, 0x74, 0x69, 0x74, 0x79, 0x52, 0x0a, 0x62, 0x61, 0x73,
	0x65, 0x45, 0x6e, 0x74, 0x69, 0x74, 0x79, 0x12, 0x29, 0x0a, 0x04, 0x74, 0x65, 0x73, 0x74, 0x18,
	0x02, 0x20, 0x01, 0x28, 0x0b, 0x32, 0x15, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x2e, 0x52, 0x65,
	0x73, 0x50, 0x61, 0x74, 0x69, 0x65, 0x6e, 0x74, 0x54, 0x65, 0x73, 0x74, 0x52, 0x04, 0x74, 0x65,
	0x73, 0x74, 0x12, 0x2e, 0x0a, 0x08, 0x71, 0x75, 0x65, 0x73, 0x74, 0x69, 0x6f, 0x6e, 0x18, 0x03,
	0x20, 0x01, 0x28, 0x0b, 0x32, 0x12, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x2e, 0x54, 0x73, 0x74,
	0x51, 0x75, 0x65, 0x73, 0x74, 0x69, 0x6f, 0x6e, 0x52, 0x08, 0x71, 0x75, 0x65, 0x73, 0x74, 0x69,
	0x6f, 0x6e, 0x12, 0x1b, 0x0a, 0x06, 0x61, 0x6e, 0x73, 0x77, 0x65, 0x72, 0x18, 0x04, 0x20, 0x01,
	0x28, 0x09, 0x48, 0x00, 0x52, 0x06, 0x61, 0x6e, 0x73, 0x77, 0x65, 0x72, 0x88, 0x01, 0x01, 0x12,
	0x32, 0x0a, 0x06, 0x6f, 0x70, 0x74, 0x69, 0x6f, 0x6e, 0x18, 0x05, 0x20, 0x01, 0x28, 0x0b, 0x32,
	0x15, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x2e, 0x4c, 0x73, 0x74, 0x4f, 0x70, 0x74, 0x69, 0x6f,
	0x6e, 0x45, 0x6e, 0x74, 0x72, 0x79, 0x48, 0x01, 0x52, 0x06, 0x6f, 0x70, 0x74, 0x69, 0x6f, 0x6e,
	0x88, 0x01, 0x01, 0x12, 0x30, 0x0a, 0x07, 0x65, 0x6d, 0x6f, 0x74, 0x69, 0x6f, 0x6e, 0x18, 0x06,
	0x20, 0x01, 0x28, 0x0b, 0x32, 0x11, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x2e, 0x45, 0x6d, 0x6f,
	0x45, 0x6d, 0x6f, 0x74, 0x69, 0x6f, 0x6e, 0x48, 0x02, 0x52, 0x07, 0x65, 0x6d, 0x6f, 0x74, 0x69,
	0x6f, 0x6e, 0x88, 0x01, 0x01, 0x12, 0x27, 0x0a, 0x04, 0x6d, 0x6f, 0x6f, 0x64, 0x18, 0x07, 0x20,
	0x01, 0x28, 0x0b, 0x32, 0x0e, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x2e, 0x45, 0x6d, 0x6f, 0x4d,
	0x6f, 0x6f, 0x64, 0x48, 0x03, 0x52, 0x04, 0x6d, 0x6f, 0x6f, 0x64, 0x88, 0x01, 0x01, 0x12, 0x38,
	0x0a, 0x0c, 0x63, 0x6f, 0x6d, 0x70, 0x6c, 0x65, 0x74, 0x65, 0x64, 0x5f, 0x61, 0x74, 0x18, 0x08,
	0x20, 0x01, 0x28, 0x0b, 0x32, 0x10, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x2e, 0x54, 0x69, 0x6d,
	0x65, 0x73, 0x74, 0x61, 0x6d, 0x70, 0x48, 0x04, 0x52, 0x0b, 0x63, 0x6f, 0x6d, 0x70, 0x6c, 0x65,
	0x74, 0x65, 0x64, 0x41, 0x74, 0x88, 0x01, 0x01, 0x12, 0x36, 0x0a, 0x0c, 0x65, 0x76, 0x61, 0x6c,
	0x75, 0x61, 0x74, 0x65, 0x64, 0x5f, 0x62, 0x79, 0x18, 0x09, 0x20, 0x01, 0x28, 0x0b, 0x32, 0x0e,
	0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x2e, 0x55, 0x73, 0x72, 0x55, 0x73, 0x65, 0x72, 0x48, 0x05,
	0x52, 0x0b, 0x65, 0x76, 0x61, 0x6c, 0x75, 0x61, 0x74, 0x65, 0x64, 0x42, 0x79, 0x88, 0x01, 0x01,
	0x12, 0x38, 0x0a, 0x0c, 0x65, 0x76, 0x61, 0x6c, 0x75, 0x61, 0x74, 0x65, 0x64, 0x5f, 0x61, 0x74,
	0x18, 0x0a, 0x20, 0x01, 0x28, 0x0b, 0x32, 0x10, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x2e, 0x54,
	0x69, 0x6d, 0x65, 0x73, 0x74, 0x61, 0x6d, 0x70, 0x48, 0x06, 0x52, 0x0b, 0x65, 0x76, 0x61, 0x6c,
	0x75, 0x61, 0x74, 0x65, 0x64, 0x41, 0x74, 0x88, 0x01, 0x01, 0x12, 0x23, 0x0a, 0x0a, 0x65, 0x76,
	0x61, 0x6c, 0x75, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x18, 0x0b, 0x20, 0x01, 0x28, 0x09, 0x48, 0x07,
	0x52, 0x0a, 0x65, 0x76, 0x61, 0x6c, 0x75, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x88, 0x01, 0x01, 0x42,
	0x09, 0x0a, 0x07, 0x5f, 0x61, 0x6e, 0x73, 0x77, 0x65, 0x72, 0x42, 0x09, 0x0a, 0x07, 0x5f, 0x6f,
	0x70, 0x74, 0x69, 0x6f, 0x6e, 0x42, 0x0a, 0x0a, 0x08, 0x5f, 0x65, 0x6d, 0x6f, 0x74, 0x69, 0x6f,
	0x6e, 0x42, 0x07, 0x0a, 0x05, 0x5f, 0x6d, 0x6f, 0x6f, 0x64, 0x42, 0x0f, 0x0a, 0x0d, 0x5f, 0x63,
	0x6f, 0x6d, 0x70, 0x6c, 0x65, 0x74, 0x65, 0x64, 0x5f, 0x61, 0x74, 0x42, 0x0f, 0x0a, 0x0d, 0x5f,
	0x65, 0x76, 0x61, 0x6c, 0x75, 0x61, 0x74, 0x65, 0x64, 0x5f, 0x62, 0x79, 0x42, 0x0f, 0x0a, 0x0d,
	0x5f, 0x65, 0x76, 0x61, 0x6c, 0x75, 0x61, 0x74, 0x65, 0x64, 0x5f, 0x61, 0x74, 0x42, 0x0d, 0x0a,
	0x0b, 0x5f, 0x65, 0x76, 0x61, 0x6c, 0x75, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x42, 0x04, 0x5a, 0x02,
	0x2e, 0x2f, 0x62, 0x06, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x33,
}

var (
	file_resmod_res_answer_proto_rawDescOnce sync.Once
	file_resmod_res_answer_proto_rawDescData = file_resmod_res_answer_proto_rawDesc
)

func file_resmod_res_answer_proto_rawDescGZIP() []byte {
	file_resmod_res_answer_proto_rawDescOnce.Do(func() {
		file_resmod_res_answer_proto_rawDescData = protoimpl.X.CompressGZIP(file_resmod_res_answer_proto_rawDescData)
	})
	return file_resmod_res_answer_proto_rawDescData
}

var file_resmod_res_answer_proto_msgTypes = make([]protoimpl.MessageInfo, 1)
var file_resmod_res_answer_proto_goTypes = []any{
	(*ResAnswer)(nil),      // 0: proto.ResAnswer
	(*ModelEntity)(nil),    // 1: proto.ModelEntity
	(*ResPatientTest)(nil), // 2: proto.ResPatientTest
	(*TstQuestion)(nil),    // 3: proto.TstQuestion
	(*LstOptionEntry)(nil), // 4: proto.LstOptionEntry
	(*EmoEmotion)(nil),     // 5: proto.EmoEmotion
	(*EmoMood)(nil),        // 6: proto.EmoMood
	(*Timestamp)(nil),      // 7: proto.Timestamp
	(*UsrUser)(nil),        // 8: proto.UsrUser
}
var file_resmod_res_answer_proto_depIdxs = []int32{
	1, // 0: proto.ResAnswer.base_entity:type_name -> proto.ModelEntity
	2, // 1: proto.ResAnswer.test:type_name -> proto.ResPatientTest
	3, // 2: proto.ResAnswer.question:type_name -> proto.TstQuestion
	4, // 3: proto.ResAnswer.option:type_name -> proto.LstOptionEntry
	5, // 4: proto.ResAnswer.emotion:type_name -> proto.EmoEmotion
	6, // 5: proto.ResAnswer.mood:type_name -> proto.EmoMood
	7, // 6: proto.ResAnswer.completed_at:type_name -> proto.Timestamp
	8, // 7: proto.ResAnswer.evaluated_by:type_name -> proto.UsrUser
	7, // 8: proto.ResAnswer.evaluated_at:type_name -> proto.Timestamp
	9, // [9:9] is the sub-list for method output_type
	9, // [9:9] is the sub-list for method input_type
	9, // [9:9] is the sub-list for extension type_name
	9, // [9:9] is the sub-list for extension extendee
	0, // [0:9] is the sub-list for field type_name
}

func init() { file_resmod_res_answer_proto_init() }
func file_resmod_res_answer_proto_init() {
	if File_resmod_res_answer_proto != nil {
		return
	}
	file_model_entity_proto_init()
	file_gbl_timestamp_proto_init()
	file_emomod_emo_entities_proto_init()
	file_lstmod_lst_option_entry_proto_init()
	file_resmod_res_patient_test_proto_init()
	file_tstmod_tst_question_proto_init()
	file_usrmod_usr_user_proto_init()
	if !protoimpl.UnsafeEnabled {
		file_resmod_res_answer_proto_msgTypes[0].Exporter = func(v any, i int) any {
			switch v := v.(*ResAnswer); i {
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
	file_resmod_res_answer_proto_msgTypes[0].OneofWrappers = []any{}
	type x struct{}
	out := protoimpl.TypeBuilder{
		File: protoimpl.DescBuilder{
			GoPackagePath: reflect.TypeOf(x{}).PkgPath(),
			RawDescriptor: file_resmod_res_answer_proto_rawDesc,
			NumEnums:      0,
			NumMessages:   1,
			NumExtensions: 0,
			NumServices:   0,
		},
		GoTypes:           file_resmod_res_answer_proto_goTypes,
		DependencyIndexes: file_resmod_res_answer_proto_depIdxs,
		MessageInfos:      file_resmod_res_answer_proto_msgTypes,
	}.Build()
	File_resmod_res_answer_proto = out.File
	file_resmod_res_answer_proto_rawDesc = nil
	file_resmod_res_answer_proto_goTypes = nil
	file_resmod_res_answer_proto_depIdxs = nil
}
