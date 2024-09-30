// Fitxer de definició proto pels serveis del mòdul USRMOD.

// Code generated by protoc-gen-go-grpc. DO NOT EDIT.
// versions:
// - protoc-gen-go-grpc v1.5.1
// - protoc             v5.28.2
// source: usrmod/usr_services.proto

package __

import (
	context "context"
	grpc "google.golang.org/grpc"
	codes "google.golang.org/grpc/codes"
	status "google.golang.org/grpc/status"
)

// This is a compile-time assertion to ensure that this generated file
// is compatible with the grpc package it is being compiled against.
// Requires gRPC-Go v1.64.0 or later.
const _ = grpc.SupportPackageIsVersion9

const (
	UsrService_CreateNewUser_FullMethodName = "/proto.UsrService/CreateNewUser"
	UsrService_UpdateUser_FullMethodName    = "/proto.UsrService/UpdateUser"
	UsrService_FindUserById_FullMethodName  = "/proto.UsrService/FindUserById"
	UsrService_UserAction_FullMethodName    = "/proto.UsrService/UserAction"
)

// UsrServiceClient is the client API for UsrService service.
//
// For semantics around ctx use and closing/ending streaming RPCs, please refer to https://pkg.go.dev/google.golang.org/grpc/?tab=doc#ClientConn.NewStream.
type UsrServiceClient interface {
	// Petició per a que el servidor crei un nou usuari.
	CreateNewUser(ctx context.Context, in *UsrFlowCreateUser, opts ...grpc.CallOption) (*UsrUser, error)
	// Petició per a modificar les dades d'un usuari.
	UpdateUser(ctx context.Context, in *UsrFlowUpdateUser, opts ...grpc.CallOption) (*UsrUser, error)
	FindUserById(ctx context.Context, in *GbReqtInstanceById, opts ...grpc.CallOption) (*UsrUser, error)
	UserAction(ctx context.Context, in *UsrReqtUserAction, opts ...grpc.CallOption) (*UsrRespUserAction, error)
}

type usrServiceClient struct {
	cc grpc.ClientConnInterface
}

func NewUsrServiceClient(cc grpc.ClientConnInterface) UsrServiceClient {
	return &usrServiceClient{cc}
}

func (c *usrServiceClient) CreateNewUser(ctx context.Context, in *UsrFlowCreateUser, opts ...grpc.CallOption) (*UsrUser, error) {
	cOpts := append([]grpc.CallOption{grpc.StaticMethod()}, opts...)
	out := new(UsrUser)
	err := c.cc.Invoke(ctx, UsrService_CreateNewUser_FullMethodName, in, out, cOpts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *usrServiceClient) UpdateUser(ctx context.Context, in *UsrFlowUpdateUser, opts ...grpc.CallOption) (*UsrUser, error) {
	cOpts := append([]grpc.CallOption{grpc.StaticMethod()}, opts...)
	out := new(UsrUser)
	err := c.cc.Invoke(ctx, UsrService_UpdateUser_FullMethodName, in, out, cOpts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *usrServiceClient) FindUserById(ctx context.Context, in *GbReqtInstanceById, opts ...grpc.CallOption) (*UsrUser, error) {
	cOpts := append([]grpc.CallOption{grpc.StaticMethod()}, opts...)
	out := new(UsrUser)
	err := c.cc.Invoke(ctx, UsrService_FindUserById_FullMethodName, in, out, cOpts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *usrServiceClient) UserAction(ctx context.Context, in *UsrReqtUserAction, opts ...grpc.CallOption) (*UsrRespUserAction, error) {
	cOpts := append([]grpc.CallOption{grpc.StaticMethod()}, opts...)
	out := new(UsrRespUserAction)
	err := c.cc.Invoke(ctx, UsrService_UserAction_FullMethodName, in, out, cOpts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

// UsrServiceServer is the server API for UsrService service.
// All implementations must embed UnimplementedUsrServiceServer
// for forward compatibility.
type UsrServiceServer interface {
	// Petició per a que el servidor crei un nou usuari.
	CreateNewUser(context.Context, *UsrFlowCreateUser) (*UsrUser, error)
	// Petició per a modificar les dades d'un usuari.
	UpdateUser(context.Context, *UsrFlowUpdateUser) (*UsrUser, error)
	FindUserById(context.Context, *GbReqtInstanceById) (*UsrUser, error)
	UserAction(context.Context, *UsrReqtUserAction) (*UsrRespUserAction, error)
	mustEmbedUnimplementedUsrServiceServer()
}

// UnimplementedUsrServiceServer must be embedded to have
// forward compatible implementations.
//
// NOTE: this should be embedded by value instead of pointer to avoid a nil
// pointer dereference when methods are called.
type UnimplementedUsrServiceServer struct{}

func (UnimplementedUsrServiceServer) CreateNewUser(context.Context, *UsrFlowCreateUser) (*UsrUser, error) {
	return nil, status.Errorf(codes.Unimplemented, "method CreateNewUser not implemented")
}
func (UnimplementedUsrServiceServer) UpdateUser(context.Context, *UsrFlowUpdateUser) (*UsrUser, error) {
	return nil, status.Errorf(codes.Unimplemented, "method UpdateUser not implemented")
}
func (UnimplementedUsrServiceServer) FindUserById(context.Context, *GbReqtInstanceById) (*UsrUser, error) {
	return nil, status.Errorf(codes.Unimplemented, "method FindUserById not implemented")
}
func (UnimplementedUsrServiceServer) UserAction(context.Context, *UsrReqtUserAction) (*UsrRespUserAction, error) {
	return nil, status.Errorf(codes.Unimplemented, "method UserAction not implemented")
}
func (UnimplementedUsrServiceServer) mustEmbedUnimplementedUsrServiceServer() {}
func (UnimplementedUsrServiceServer) testEmbeddedByValue()                    {}

// UnsafeUsrServiceServer may be embedded to opt out of forward compatibility for this service.
// Use of this interface is not recommended, as added methods to UsrServiceServer will
// result in compilation errors.
type UnsafeUsrServiceServer interface {
	mustEmbedUnimplementedUsrServiceServer()
}

func RegisterUsrServiceServer(s grpc.ServiceRegistrar, srv UsrServiceServer) {
	// If the following call pancis, it indicates UnimplementedUsrServiceServer was
	// embedded by pointer and is nil.  This will cause panics if an
	// unimplemented method is ever invoked, so we test this at initialization
	// time to prevent it from happening at runtime later due to I/O.
	if t, ok := srv.(interface{ testEmbeddedByValue() }); ok {
		t.testEmbeddedByValue()
	}
	s.RegisterService(&UsrService_ServiceDesc, srv)
}

func _UsrService_CreateNewUser_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(UsrFlowCreateUser)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(UsrServiceServer).CreateNewUser(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: UsrService_CreateNewUser_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(UsrServiceServer).CreateNewUser(ctx, req.(*UsrFlowCreateUser))
	}
	return interceptor(ctx, in, info, handler)
}

func _UsrService_UpdateUser_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(UsrFlowUpdateUser)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(UsrServiceServer).UpdateUser(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: UsrService_UpdateUser_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(UsrServiceServer).UpdateUser(ctx, req.(*UsrFlowUpdateUser))
	}
	return interceptor(ctx, in, info, handler)
}

func _UsrService_FindUserById_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(GbReqtInstanceById)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(UsrServiceServer).FindUserById(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: UsrService_FindUserById_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(UsrServiceServer).FindUserById(ctx, req.(*GbReqtInstanceById))
	}
	return interceptor(ctx, in, info, handler)
}

func _UsrService_UserAction_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(UsrReqtUserAction)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(UsrServiceServer).UserAction(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: UsrService_UserAction_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(UsrServiceServer).UserAction(ctx, req.(*UsrReqtUserAction))
	}
	return interceptor(ctx, in, info, handler)
}

// UsrService_ServiceDesc is the grpc.ServiceDesc for UsrService service.
// It's only intended for direct use with grpc.RegisterService,
// and not to be introspected or modified (even as a copy)
var UsrService_ServiceDesc = grpc.ServiceDesc{
	ServiceName: "proto.UsrService",
	HandlerType: (*UsrServiceServer)(nil),
	Methods: []grpc.MethodDesc{
		{
			MethodName: "CreateNewUser",
			Handler:    _UsrService_CreateNewUser_Handler,
		},
		{
			MethodName: "UpdateUser",
			Handler:    _UsrService_UpdateUser_Handler,
		},
		{
			MethodName: "FindUserById",
			Handler:    _UsrService_FindUserById_Handler,
		},
		{
			MethodName: "UserAction",
			Handler:    _UsrService_UserAction_Handler,
		},
	},
	Streams:  []grpc.StreamDesc{},
	Metadata: "usrmod/usr_services.proto",
}
