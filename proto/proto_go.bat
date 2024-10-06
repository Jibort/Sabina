@echo off
setlocal
cls

echo Variables...
set "goout=../server/proto"
set "globalout=%goout%/global"
set "usrmodout=%goout%/usrmod"
set "dismodout=%goout%/dismod"
set "rscmodout=%goout%/rscmod"
set "tckmodout=%goout%/tckmod"
set "tstmodout=%goout%/tstmod"
set "emomodout=%goout%/emomod"
set "dgnmodout=%goout%/dgnmod"
set "matmodout=%goout%/matmod"
set "regmodout=%goout%/regmod"
set "resmodout=%goout%/resmod"
set "tskmodout=%goout%/tskmod"
set "vismodout=%goout%/vismod"
set "ntfmodout=%goout%/ntfmod"
set "lstmodout=%goout%/lstmod"
set "locmodout=%goout%/locmod"

set relpath=--go_opt=paths=source_relative --go-grpc_opt=paths=source_relative

echo Compil.lant fitxers proto en codi Golang (complet)...
echo .
echo Global Area...
echo F_GLOBAL: %globalout%
echo Compiling base_entity.proto
protoc --proto_path=. --go_out=%globalout% --go-grpc_out=%globalout% gbl_enumerations.proto 
echo Compiling global.proto
protoc --proto_path=. --go_out=%globalout% --go-grpc_out=%globalout% gbl_global.proto
echo Compiling timestamp.proto
protoc --proto_path=. --go_out=%globalout% --go-grpc_out=%globalout% gbl_timestamp.proto

echo .
echo a_user...
echo USRMOD: %usrmodout%
echo Compiling usr_user.proto
protoc --proto_path=. --go_out=%usrmodout% --go-grpc_out=%usrmodout% usrmod/usr_user.proto
echo Compiling usr_device.proto
protoc --proto_path=. --go_out=%usrmodout% --go-grpc_out=%usrmodout% usrmod/usr_device.proto
echo Compiling usr_fcm_history.proto
protoc --proto_path=. --go_out=%usrmodout% --go-grpc_out=%usrmodout% usrmod/usr_fcm_history.proto
echo Compiling usr_services.proto
protoc --proto_path=. --go_out=%usrmodout% --go-grpc_out=%usrmodout% usrmod/usr_services.proto

echo .
echo e_localization...
echo LOCMOD: %locmodout%
echo Compiling loc_translation.proto
protoc --proto_path=. --go_out=%locmodout% --go-grpc_out=%locmodout% locmod/loc_translation.proto
echo Compiling loc_services.proto
protoc --proto_path=. --go_out=%locmodout% --go-grpc_out=%locmodout% locmod/loc_services.proto

echo .
echo LSTMOD: %lstmodout%
echo Compiling lst_list_category.proto
protoc --proto_path=. --go_out=%lstmodout% --go-grpc_out=%lstmodout% lstmod/lst_list_category.proto
echo Compiling lst_option_list.proto
protoc --proto_path=. --go_out=%lstmodout% --go-grpc_out=%lstmodout% lstmod/lst_option_list.proto
echo Compiling lst_option_entry.proto
protoc --proto_path=. --go_out=%lstmodout% --go-grpc_out=%lstmodout% lstmod/lst_option_entry.proto
@REM echo Compiling lst_services.proto
@REM protoc --proto_path=. --go_out=%lstmodout% --go-grpc_out=%lstmodout% lstmod/lst_services.proto


echo .
echo b_definitions...
echo EMOMOD: %emomodout%
echo Compiling emo_entities.proto
protoc --proto_path=. --go_out=%emomodout% --go-grpc_out=%emomodout% emomod/emo_entities.proto
echo Compiling emo_services.proto
protoc --proto_path=. --go_out=%emomodout% --go-grpc_out=%emomodout% emomod/emo_services.proto
echo Compiling emo_sync.proto
protoc --proto_path=. --go_out=%emomodout% --go-grpc_out=%emomodout% emomod/emo_sync.proto

echo .
echo DISMOD: %dismodout%
echo Compiling dis_dsm_v.proto
protoc --proto_path=. --go_out=%dismodout% --go-grpc_out=%dismodout% dismod/dis_dsm_v.proto
echo Compiling dis_disease.proto
protoc --proto_path=. --go_out=%dismodout% --go-grpc_out=%dismodout% dismod/dis_disease.proto
echo Compiling dis_phase.proto
protoc --proto_path=. --go_out=%dismodout% --go-grpc_out=%dismodout% dismod/dis_phase.proto
echo Compiling dis_goal.proto
protoc --proto_path=. --go_out=%dismodout% --go-grpc_out=%dismodout% dismod/dis_goal.proto

@REM @REM echo Compiling dis_services.proto
@REM @REM protoc --proto_path=. --go_out=%dismodout% --go-grpc_out=%dismodout% dismod/dis_services.proto

echo .
echo TSTMOD: %tstmodout%
echo Compiling tst_test_category.proto
protoc --proto_path=. --go_out=%tstmodout% --go-grpc_out=%tstmodout% tstmod/tst_test_category.proto
echo Compiling tst_test.proto
protoc --proto_path=. --go_out=%tstmodout% --go-grpc_out=%tstmodout% tstmod/tst_test.proto
echo Compiling tst_question.proto
protoc --proto_path=. --go_out=%tstmodout% --go-grpc_out=%tstmodout% tstmod/tst_question.proto

@REM echo Compiling tst_services.proto
@REM protoc --proto_path=. --go_out=%tstmodout% --go-grpc_out=%tstmodout% tstmod/tst_services.proto

echo .
echo RESMOD: %resmodout%
echo Compiling res_patient_test.proto
protoc --proto_path=. --go_out=%resmodout% --go-grpc_out=%resmodout% resmod/res_patient_test.proto
echo Compiling res_answer.proto
protoc --proto_path=. --go_out=%resmodout% --go-grpc_out=%resmodout% resmod/res_answer.proto

@REM echo Compiling res_services.proto
@REM protoc --proto_path=. --go_out=%resmodout% --go-grpc_out=%resmodout% resmod/res_services.proto

@REM @REM echo TCKMOD
@REM @REM echo Compiling tck_tracking.proto
@REM @REM protoc --proto_path=. --go_out=%tckmodout% --go-grpc_out=%tckmodout% tckmdod/tck_tracking.proto
@REM @REM echo Compiling tck_phase_tracking.proto
@REM @REM protoc --proto_path=. --go_out=%tckmodout% --go-grpc_out=%tckmodout% tckmdod/tck_phase_tracking.proto
@REM @REM echo Compiling tck_tracking_column.proto
@REM @REM protoc --proto_path=. --go_out=%tckmodout% --go-grpc_out=%tckmodout% tckmdod/tck_tracking_column.proto
@REM @REM echo Compiling tck_services.proto
@REM @REM protoc --proto_path=. --go_out=%tckmodout% --go-grpc_out=%tckmodout% tckmdod/tck_services.proto

@REM @REM echo g_synchro...
@REM @REM protoc --proto_path=. --go_out=../server/proto --go-grpc_out=../server/proto sync_dgnmod.proto 
@REM @REM protoc --proto_path=. --go_out=../server/proto --go-grpc_out=../server/proto sync_dismod.proto 
@REM @REM protoc --proto_path=. --go_out=../server/proto --go-grpc_out=../server/proto sync_emomod.proto 
@REM @REM protoc --proto_path=. --go_out=../server/proto --go-grpc_out=../server/proto sync_locmod.proto 
@REM @REM protoc --proto_path=. --go_out=../server/proto --go-grpc_out=../server/proto sync_lstmod.proto 
@REM @REM protoc --proto_path=. --go_out=../server/proto --go-grpc_out=../server/proto sync_matmod.proto 
@REM @REM protoc --proto_path=. --go_out=../server/proto --go-grpc_out=../server/proto sync_ntfmod.proto 
@REM @REM protoc --proto_path=. --go_out=../server/proto --go-grpc_out=../server/proto sync_regmod.proto 
@REM @REM protoc --proto_path=. --go_out=../server/proto --go-grpc_out=../server/proto sync_resmod.proto 
@REM @REM protoc --proto_path=. --go_out=../server/proto --go-grpc_out=../server/proto sync_rscmod.proto 
@REM @REM protoc --proto_path=. --go_out=../server/proto --go-grpc_out=../server/proto sync_tckmod.proto 
@REM @REM protoc --proto_path=. --go_out=../server/proto --go-grpc_out=../server/proto sync_tskmod.proto 
@REM @REM protoc --proto_path=. --go_out=../server/proto --go-grpc_out=../server/proto sync_tstmod.proto 
@REM @REM protoc --proto_path=. --go_out=../server/proto --go-grpc_out=../server/proto sync_usrmod.proto 
@REM @REM protoc --proto_path=. --go_out=../server/proto --go-grpc_out=../server/proto sync_vismod.proto 
@REM @REM protoc --proto_path=. --go_out=../server/proto --go-grpc_out=../server/proto sync_entities.proto
@REM @REM protoc --proto_path=. --go_out=../server/proto --go-grpc_out=../server/proto sync_services.proto

endlocal
exit /B 0

