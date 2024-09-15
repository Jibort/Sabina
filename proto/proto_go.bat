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
echo Global Area...
echo F_GLOBAL: %globalout%
echo ---> base_entity.proto
protoc --proto_path=. --go_out=%globalout% --go-grpc_out=%globalout% enumerations.proto 
echo ---> global.proto
protoc --proto_path=. --go_out=%globalout% --go-grpc_out=%globalout% global.proto
echo ---> timestamp.proto
protoc --proto_path=. --go_out=%globalout% --go-grpc_out=%globalout% timestamp.proto

echo .
echo a_user...
echo USRMOD: %usrmodout%
echo ---> usr_user.proto
protoc --proto_path=. --go_out=%usrmodout% --go-grpc_out=%usrmodout% usrmod/usr_user.proto
echo ---> usr_device.proto
protoc --proto_path=. --go_out=%usrmodout% --go-grpc_out=%usrmodout% usrmod/usr_device.proto
echo ---> usr_fcm_history.proto
protoc --proto_path=. --go_out=%usrmodout% --go-grpc_out=%usrmodout% usrmod/usr_fcm_history.proto
echo ---> usr_services.proto
protoc --proto_path=. --go_out=%usrmodout% --go-grpc_out=%usrmodout% usrmod/usr_services.proto

echo .
echo e_localization...
echo LOCMOD
@REM protoc --proto_path=. --go_out=../server/proto --go-grpc_out=../server/proto loc_entities.proto
@REM protoc --proto_path=. --go_out=../server/proto --go-grpc_out=../server/proto loc_requests.proto
echo ---> loc_translation.proto
protoc --proto_path=. --go_out=%locmodout% --go-grpc_out=%locmodout% loc_translation.proto
echo ---> loc_services.proto
protoc --proto_path=. --go_out=%locmodout% --go-grpc_out=%locmodout% loc_services.proto

echo .
echo LSTMOD
echo ---> lst_list_category.proto
protoc --proto_path=. --go_out=%lstmodout% --go-grpc_out=%lstmodout% lst_list_category.proto
echo ---> lst_option_list.proto
protoc --proto_path=. --go_out=%lstmodout% --go-grpc_out=%lstmodout% lst_option_list.proto
echo ---> lst_option_entry.proto
protoc --proto_path=. --go_out=%lstmodout% --go-grpc_out=%lstmodout% lst_option_entry.proto
echo ---> lst_services.proto
protoc --proto_path=. --go_out=%lstmodout% --go-grpc_out=%lstmodout% lst_services.proto

echo b_definitions...
echo DISMOD
echo ---> dis_dsm_v.proto
protoc --proto_path=. --go_out=%dismodout% --go-grpc_out=%dismodout% dis_dsm_v.proto
echo ---> dis_disease.proto
protoc --proto_path=. --go_out=%dismodout% --go-grpc_out=%dismodout% dis_disease.proto
echo ---> dis_phase.proto
protoc --proto_path=. --go_out=%dismodout% --go-grpc_out=%dismodout% dis_phase.proto
echo ---> dis_goal.proto
protoc --proto_path=. --go_out=%dismodout% --go-grpc_out=%dismodout% dis_goal.proto
echo ---> dis_services.proto
protoc --proto_path=. --go_out=%dismodout% --go-grpc_out=%dismodout% dis_services.proto

echo EMOMOD
echo ---> emo_emotion.proto
protoc --proto_path=. --go_out=%emomodout% --go-grpc_out=%emomodout% emo_emotion.proto
echo ---> emo_mood.proto
protoc --proto_path=. --go_out=%emomodout% --go-grpc_out=%emomodout% emo_mood.proto
echo ---> emo_services.proto
protoc --proto_path=. --go_out=%emomodout% --go-grpc_out=%emomodout% emo_services.proto

echo RESMOD
echo ---> res_patient_test.proto
protoc --proto_path=. --go_out=%resmodout% --go-grpc_out=%resmodout% res_patient_test.proto
echo ---> res_answer.proto
protoc --proto_path=. --go_out=%resmodout% --go-grpc_out=%resmodout% res_answer.proto
echo ---> res_services.proto
protoc --proto_path=. --go_out=%resmodout% --go-grpc_out=%resmodout% res_services.proto

echo TCKMOD
echo ---> tck_tracking.proto
protoc --proto_path=. --go_out=%tckmodout% --go-grpc_out=%tckmodout% tck_tracking.proto
echo ---> tck_phase_tracking.proto
protoc --proto_path=. --go_out=%tckmodout% --go-grpc_out=%tckmodout% tck_phase_tracking.proto
echo ---> tck_tracking_column.proto
protoc --proto_path=. --go_out=%tckmodout% --go-grpc_out=%tckmodout% tck_tracking_column.proto
echo ---> tck_services.proto
protoc --proto_path=. --go_out=%tckmodout% --go-grpc_out=%tckmodout% tck_services.proto

echo TSTMOD
echo ---> tst_test_category.proto
protoc --proto_path=. --go_out=%tstmodout% --go-grpc_out=%tstmodout% tst_test_category.proto
echo ---> tst_test.proto
protoc --proto_path=. --go_out=%tstmodout% --go-grpc_out=%tstmodout% tst_test.proto
echo ---> tst_question.proto
protoc --proto_path=. --go_out=%tstmodout% --go-grpc_out=%tstmodout% tst_question.proto
echo ---> tst_services.proto
protoc --proto_path=. --go_out=%tstmodout% --go-grpc_out=%tstmodout% tst_services.proto

@REM echo g_synchro...
@REM protoc --proto_path=. --go_out=../server/proto --go-grpc_out=../server/proto sync_dgnmod.proto 
@REM protoc --proto_path=. --go_out=../server/proto --go-grpc_out=../server/proto sync_dismod.proto 
@REM protoc --proto_path=. --go_out=../server/proto --go-grpc_out=../server/proto sync_emomod.proto 
@REM protoc --proto_path=. --go_out=../server/proto --go-grpc_out=../server/proto sync_locmod.proto 
@REM protoc --proto_path=. --go_out=../server/proto --go-grpc_out=../server/proto sync_lstmod.proto 
@REM protoc --proto_path=. --go_out=../server/proto --go-grpc_out=../server/proto sync_matmod.proto 
@REM protoc --proto_path=. --go_out=../server/proto --go-grpc_out=../server/proto sync_ntfmod.proto 
@REM protoc --proto_path=. --go_out=../server/proto --go-grpc_out=../server/proto sync_regmod.proto 
@REM protoc --proto_path=. --go_out=../server/proto --go-grpc_out=../server/proto sync_resmod.proto 
@REM protoc --proto_path=. --go_out=../server/proto --go-grpc_out=../server/proto sync_rscmod.proto 
@REM protoc --proto_path=. --go_out=../server/proto --go-grpc_out=../server/proto sync_tckmod.proto 
@REM protoc --proto_path=. --go_out=../server/proto --go-grpc_out=../server/proto sync_tskmod.proto 
@REM protoc --proto_path=. --go_out=../server/proto --go-grpc_out=../server/proto sync_tstmod.proto 
@REM protoc --proto_path=. --go_out=../server/proto --go-grpc_out=../server/proto sync_usrmod.proto 
@REM protoc --proto_path=. --go_out=../server/proto --go-grpc_out=../server/proto sync_vismod.proto 
@REM protoc --proto_path=. --go_out=../server/proto --go-grpc_out=../server/proto sync_entities.proto
@REM protoc --proto_path=. --go_out=../server/proto --go-grpc_out=../server/proto sync_services.proto

endlocal
exit /B 0

