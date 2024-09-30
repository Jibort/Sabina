@echo off
setlocal
cls

echo Variables...
set "out_dir=../ld_learn/lib/05_proto"
set "globalout=%out_dir%"
set "usrmodout=%out_dir%/usrmod"
set "locmodout=%out_dir%/locmod"
set "lstmodout=%out_dir%/lstmod"
set "dismodout=%out_dir%/dismod"
set "emomodout=%out_dir%/emomod"
set "tstmodout=%out_dir%/tstmod"
set "resmodout=%out_dir%/resmod"
set "tckmodout=%out_dir%/tckmod"

set in_global=.

set in_usrmod=%in_global%/usrmod

set in_dismod=%in_global%/dismod
set in_emomod=%in_global%/emomod
set in_tckmod=%in_global%/tckmod
set in_tstmod=%in_global%/tstmod
set in_rscmod=%in_global%/rscmod

set in_resmod=%in_global%/resmod

set in_locmod=%in_global%/locmod
set in_lstmod=%in_global%/lstmod

set in_g_synch=%in_global%/g_sync

echo Compil.lant fitxers proto en codi Flutter (complet)...

echo Global Module...
echo F_GLOBAL: %globalout%
echo Compiling gbl_timestamp.proto
protoc -I=. --dart_out=grpc:%globalout% %in_global%/gbl_timestamp.proto
echo Compiling gbl_enumerations.proto
protoc -I=. --dart_out=grpc:%globalout% %in_global%/gbl_enumerations.proto
echo Compiling gbl_global.proto
protoc -I=. --dart_out=grpc:%globalout% %in_global%/gbl_global.proto

echo .
echo a_user...
echo USRMOD: %usrmodout%
echo Compiling usr_user.proto
protoc -I=. --dart_out=grpc:%usrmodout% %in_usrmod%/usr_user.proto
echo Compiling usr_device.proto
protoc -I=. --dart_out=grpc:%usrmodout% %in_usrmod%/usr_device.proto
echo Compiling usr_fcm_history.proto
protoc -I=. --dart_out=grpc:%usrmodout% %in_usrmod%/usr_fcm_history.proto
echo Compiling usr_requests.proto
protoc -I=. --dart_out=grpc:%usrmodout% %in_usrmod%/usr_requests.proto
echo Compiling usr_flows.proto
protoc -I=. --dart_out=grpc:%usrmodout% %in_usrmod%/usr_flows.proto
echo Compiling usr_services.proto
protoc -I=. --dart_out=grpc:%usrmodout% %in_usrmod%/usr_services.proto

echo .
echo e_localization...
echo LOCMOD: %locmodout%
echo Compiling loc_translation.proto
protoc -I=. --dart_out=grpc:%locmodout% %in_locmod%/loc_translation.proto
echo Compiling loc_requests.proto
protoc -I=. --dart_out=grpc:%locmodout% %in_locmod%/loc_requests.proto
echo Compiling loc_services.proto
protoc -I=. --dart_out=grpc:%locmodout% %in_locmod%/loc_services.proto

echo LSTMOD: %lstmodout%
echo Compiling lst_list_category.proto
protoc -I=. --dart_out=grpc:%lstmodout% %in_lstmod%/lst_list_category.proto
echo Compiling lst_option_list.proto
protoc -I=. --dart_out=grpc:%lstmodout% %in_lstmod%/lst_option_list.proto
echo Compiling lst_option_entry.proto
protoc -I=. --dart_out=grpc:%lstmodout% %in_lstmod%/lst_option_entry.proto

echo .
echo b_definitions...
echo EMOMOD
echo Compiling emo_entities.proto
protoc -I=. --dart_out=grpc:%emomodout% %in_emomod%/emo_entities.proto
echo Compiling emo_services.proto
protoc -I=. --dart_out=grpc:%emomodout% %in_emomod%/emo_services.proto

echo DISMOD
echo Compiling dis_dsm_v.proto
protoc -I=. --dart_out=grpc:%dismodout% %in_dismod%/dis_dsm_v.proto
echo Compiling dis_disease.proto
protoc -I=. --dart_out=grpc:%dismodout% %in_dismod%/dis_disease.proto
echo Compiling dis_phase.proto
protoc -I=. --dart_out=grpc:%dismodout% %in_dismod%/dis_phase.proto
echo Compiling dis_goal.proto
protoc -I=. --dart_out=grpc:%dismodout% %in_dismod%/dis_goal.proto

echo TSTMOD
echo Compiling tst_test_category.proto
protoc -I=. --dart_out=grpc:%tstmodout% %in_tstmod%/tst_test_category.proto
echo Compiling tst_test.proto
protoc -I=. --dart_out=grpc:%tstmodout% %in_tstmod%/tst_test.proto
echo Compiling tst_question.proto
protoc -I=. --dart_out=grpc:%tstmodout% %in_tstmod%/tst_question.proto

echo .
echo c_working...
echo RESMOD
echo Compiling res_patient_test.proto
protoc -I=. --dart_out=grpc:%resmodout% %in_resmod%/res_patient_test.proto
echo Compiling res_answer.proto
protoc -I=. --dart_out=grpc:%resmodout% %in_resmod%/res_answer.proto


@REM rem echo RSCMOD
@REM rem protoc --proto_path=./b_definitions/rscmod -I=. --dart_out=grpc:%out_dir%/b_definitions/rscmod %in_tstmod%/rsc_enumerations.proto
@REM rem protoc --proto_path=./b_definitions/rscmod -I=. --dart_out=grpc:%out_dir%/b_definitions/rscmod %in_tstmod%/rsc_entities.proto

@REM echo TCKMOD
@REM protoc -I=. --dart_out=grpc:%out_dir% tck_enumerations.proto
@REM protoc -I=. --dart_out=grpc:%out_dir% tck_entities.proto

@REM echo g_synchro...
@REM protoc -I=. --dart_out=grpc:%out_dir% sync_dgnmod.proto 
@REM protoc -I=. --dart_out=grpc:%out_dir% sync_dismod.proto 
@REM protoc -I=. --dart_out=grpc:%out_dir% sync_emomod.proto 
@REM protoc -I=. --dart_out=grpc:%out_dir% sync_locmod.proto 
@REM protoc -I=. --dart_out=grpc:%out_dir% sync_lstmod.proto 
@REM protoc -I=. --dart_out=grpc:%out_dir% sync_matmod.proto 
@REM protoc -I=. --dart_out=grpc:%out_dir% sync_ntfmod.proto 
@REM protoc -I=. --dart_out=grpc:%out_dir% sync_regmod.proto 
@REM protoc -I=. --dart_out=grpc:%out_dir% sync_resmod.proto 
@REM protoc -I=. --dart_out=grpc:%out_dir% sync_rscmod.proto 
@REM protoc -I=. --dart_out=grpc:%out_dir% sync_tckmod.proto
@REM protoc -I=. --dart_out=grpc:%out_dir% sync_tskmod.proto
@REM protoc -I=. --dart_out=grpc:%out_dir% sync_tstmod.proto 
@REM protoc -I=. --dart_out=grpc:%out_dir% sync_usrmod.proto 
@REM protoc -I=. --dart_out=grpc:%out_dir% sync_vismod.proto 
@REM protoc -I=. --dart_out=grpc:%out_dir% sync_entities.proto
@REM protoc -I=. --dart_out=grpc:%out_dir% sync_services.proto


endlocal