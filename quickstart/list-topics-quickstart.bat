@echo off

SET root=%~dp0
SET kafka=%root%kafka_2.12-2.5.0
SET JAVA_HOME=%root%jdk-14.0.1

call %kafka%\bin\windows\kafka-topics.bat ^
    --list ^
    --bootstrap-server localhost:9092

pause
