@echo off
setlocal
cls

echo Variables...
set goout=../server/proto
set relpath=--go_opt=paths=source_relative --go-grpc_opt=paths=source_relative

echo Compil.lant fitxers proto en codi Golang (complet)...
echo Global Area...
echo F_GLOBAL
protoc --go_out=../server/proto --go-grpc_out=../server/proto enumerations.proto 
protoc --go_out=../server/proto --go-grpc_out=../server/proto global.proto   
protoc --go_out=../server/proto --go-grpc_out=../server/proto timestamp.proto

echo .
echo e_localization...
echo LOCMOD
protoc --go_out=../server/proto --go-grpc_out=../server/proto loc_entities.proto
protoc --go_out=../server/proto --go-grpc_out=../server/proto loc_requests.proto
protoc --go_out=../server/proto --go-grpc_out=../server/proto loc_services.proto

echo .
echo a_user...
echo USRMOD
protoc --go_out=../server/proto --go-grpc_out=../server/proto usr_enumerations.proto
protoc --go_out=../server/proto --go-grpc_out=../server/proto usr_entities.proto
protoc --go_out=../server/proto --go-grpc_out=../server/proto usr_requests.proto
protoc --go_out=../server/proto --go-grpc_out=../server/proto usr_flows.proto
protoc --go_out=../server/proto --go-grpc_out=../server/proto usr_services.proto

echo .
echo e_localization...
echo LSTMOD
protoc --go_out=../server/proto --go-grpc_out=../server/proto lst_entities.proto

echo b_definitions...
echo DISMOD
protoc --go_out=../server/proto --go-grpc_out=../server/proto dis_entities.proto

echo EMOMOD
protoc --go_out=../server/proto --go-grpc_out=../server/proto emo_entities.proto

echo RESMOD
protoc --go_out=../server/proto --go-grpc_out=../server/proto res_enumerations.proto
protoc --go_out=../server/proto --go-grpc_out=../server/proto res_entities.proto

echo TCKMOD
protoc --go_out=../server/proto --go-grpc_out=../server/proto tck_enumerations.proto
protoc --go_out=../server/proto --go-grpc_out=../server/proto tck_entities.proto

echo TSTMOD
protoc --go_out=../server/proto --go-grpc_out=../server/proto tst_enumerations.proto
protoc --go_out=../server/proto --go-grpc_out=../server/proto tst_entities.proto

echo g_synchro...
protoc --go_out=../server/proto --go-grpc_out=../server/proto sync_dgnmod.proto 
protoc --go_out=../server/proto --go-grpc_out=../server/proto sync_dismod.proto 
protoc --go_out=../server/proto --go-grpc_out=../server/proto sync_emomod.proto 
protoc --go_out=../server/proto --go-grpc_out=../server/proto sync_locmod.proto 
protoc --go_out=../server/proto --go-grpc_out=../server/proto sync_lstmod.proto 
protoc --go_out=../server/proto --go-grpc_out=../server/proto sync_matmod.proto 
protoc --go_out=../server/proto --go-grpc_out=../server/proto sync_ntfmod.proto 
protoc --go_out=../server/proto --go-grpc_out=../server/proto sync_regmod.proto 
protoc --go_out=../server/proto --go-grpc_out=../server/proto sync_resmod.proto 
protoc --go_out=../server/proto --go-grpc_out=../server/proto sync_rscmod.proto 
protoc --go_out=../server/proto --go-grpc_out=../server/proto sync_tckmod.proto 
protoc --go_out=../server/proto --go-grpc_out=../server/proto sync_tskmod.proto 
protoc --go_out=../server/proto --go-grpc_out=../server/proto sync_tstmod.proto 
protoc --go_out=../server/proto --go-grpc_out=../server/proto sync_usrmod.proto 
protoc --go_out=../server/proto --go-grpc_out=../server/proto sync_vismod.proto 
protoc --go_out=../server/proto --go-grpc_out=../server/proto sync_entities.proto
protoc --go_out=../server/proto --go-grpc_out=../server/proto sync_services.proto

endlocal
exit /B 0

























