@ECHO OFF
cls
echo Compil.lant Sabina Server 0.1
go build -o ../cmd/server/.
IF [%1] == [-r] (
    echo Executant Sabina Server 0.1
    ..\cmd\server\sabina_server.exe
)