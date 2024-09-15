@echo off
setlocal
cls

echo Compil.lant fitxers proto en codi Flutter (complet)...

echo VARIABLES
set out_dir=../clients/ld_learn/lib/05_proto

set in_timestamp=./google/protobuf

set in_global=f_global

set in_a_user=./a_user/usrmod

set in_dismod=./b_definitions/dismod
set in_emomod=./b_definitions/emomod
set in_tckmod=./b_definitions/tckmod
set in_tstmod=./b_definitions/tstmod
set in_rscmod=./b_definitions/rscmod

set in_resmod=./c_working/resmod

set in_locmod=./e_localization/locmod
set in_lstmod=./e_localization/lstmod

set in_g_synch=./g_sync

echo Global Module...
echo F_GLOBAL
protoc -I=. --dart_out=grpc:%out_dir% timestamp.proto
protoc -I=. --dart_out=grpc:%out_dir% enumerations.proto
protoc -I=. --dart_out=grpc:%out_dir% global.proto

echo e_localization...
echo LOCMOD
protoc -I=. --dart_out=grpc:%out_dir% loc_entities.proto
protoc -I=. --dart_out=grpc:%out_dir% loc_requests.proto
protoc -I=. --dart_out=grpc:%out_dir% loc_services.proto

echo a_user...
echo USRMOD
protoc -I=. --dart_out=grpc:%out_dir% usr_enumerations.proto
protoc -I=. --dart_out=grpc:%out_dir% usr_entities.proto
protoc -I=. --dart_out=grpc:%out_dir% usr_requests.proto
protoc -I=. --dart_out=grpc:%out_dir% usr_flows.proto
protoc -I=. --dart_out=grpc:%out_dir% usr_services.proto

protoc -I=. --dart_out=grpc:%out_dir% usr_enumerations.proto
protoc -I=. --dart_out=grpc:%out_dir% usr_entities.proto
protoc -I=. --dart_out=grpc:%out_dir% usr_requests.proto
protoc -I=. --dart_out=grpc:%out_dir% usr_flows.proto
protoc -I=. --dart_out=grpc:%out_dir% usr_services.proto

echo LSTMOD
protoc -I=. --dart_out=grpc:%out_dir% lst_entities.proto

echo b_definitions...
echo DISMOD
protoc -I=. --dart_out=grpc:%out_dir% dis_entities.proto

echo EMOMOD
protoc -I=. --dart_out=grpc:%out_dir% emo_entities.proto

rem echo RSCMOD
rem protoc --proto_path=./b_definitions/rscmod -I=. --dart_out=grpc:%out_dir%/b_definitions/rscmod %in_tstmod%/rsc_enumerations.proto
rem protoc --proto_path=./b_definitions/rscmod -I=. --dart_out=grpc:%out_dir%/b_definitions/rscmod %in_tstmod%/rsc_entities.proto

echo TCKMOD
protoc -I=. --dart_out=grpc:%out_dir% tck_enumerations.proto
protoc -I=. --dart_out=grpc:%out_dir% tck_entities.proto

echo TSTMOD
protoc -I=. --dart_out=grpc:%out_dir% tst_enumerations.proto
protoc -I=. --dart_out=grpc:%out_dir% tst_entities.proto

echo c_working...
echo RESMOD
protoc -I=. --dart_out=grpc:%out_dir% res_entities.proto

echo g_synchro...
protoc -I=. --dart_out=grpc:%out_dir% sync_dgnmod.proto 
protoc -I=. --dart_out=grpc:%out_dir% sync_dismod.proto 
protoc -I=. --dart_out=grpc:%out_dir% sync_emomod.proto 
protoc -I=. --dart_out=grpc:%out_dir% sync_locmod.proto 
protoc -I=. --dart_out=grpc:%out_dir% sync_lstmod.proto 
protoc -I=. --dart_out=grpc:%out_dir% sync_matmod.proto 
protoc -I=. --dart_out=grpc:%out_dir% sync_ntfmod.proto 
protoc -I=. --dart_out=grpc:%out_dir% sync_regmod.proto 
protoc -I=. --dart_out=grpc:%out_dir% sync_resmod.proto 
protoc -I=. --dart_out=grpc:%out_dir% sync_rscmod.proto 
protoc -I=. --dart_out=grpc:%out_dir% sync_tckmod.proto
protoc -I=. --dart_out=grpc:%out_dir% sync_tskmod.proto
protoc -I=. --dart_out=grpc:%out_dir% sync_tstmod.proto 
protoc -I=. --dart_out=grpc:%out_dir% sync_usrmod.proto 
protoc -I=. --dart_out=grpc:%out_dir% sync_vismod.proto 
protoc -I=. --dart_out=grpc:%out_dir% sync_entities.proto
protoc -I=. --dart_out=grpc:%out_dir% sync_services.proto

endlocal