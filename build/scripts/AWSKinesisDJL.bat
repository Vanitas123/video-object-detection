@rem
@rem Copyright 2015 the original author or authors.
@rem
@rem Licensed under the Apache License, Version 2.0 (the "License");
@rem you may not use this file except in compliance with the License.
@rem You may obtain a copy of the License at
@rem
@rem      https://www.apache.org/licenses/LICENSE-2.0
@rem
@rem Unless required by applicable law or agreed to in writing, software
@rem distributed under the License is distributed on an "AS IS" BASIS,
@rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@rem See the License for the specific language governing permissions and
@rem limitations under the License.
@rem

@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  AWSKinesisDJL startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Resolve any "." and ".." in APP_HOME to make it shorter.
for %%i in ("%APP_HOME%") do set APP_HOME=%%~fi

@rem Add default JVM options here. You can also use JAVA_OPTS and AWS_KINESIS_DJL_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if "%ERRORLEVEL%" == "0" goto execute

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto execute

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\AWSKinesisDJL-1.0-SNAPSHOT.jar;%APP_HOME%\lib\mxnet-model-zoo-0.10.0.jar;%APP_HOME%\lib\mxnet-engine-0.10.0.jar;%APP_HOME%\lib\api-0.10.0.jar;%APP_HOME%\lib\commons-cli-1.4.jar;%APP_HOME%\lib\kinesisvideo-2.10.75.jar;%APP_HOME%\lib\amazon-kinesis-client-2.2.9.jar;%APP_HOME%\lib\amazon-kinesis-video-streams-parser-library-1.0.13.jar;%APP_HOME%\lib\mxnet-native-auto-1.7.0-backport.jar;%APP_HOME%\lib\log4j-slf4j-impl-2.12.1.jar;%APP_HOME%\lib\kinesis-2.10.66.jar;%APP_HOME%\lib\dynamodb-2.10.66.jar;%APP_HOME%\lib\aws-cbor-protocol-2.10.66.jar;%APP_HOME%\lib\aws-json-protocol-2.10.75.jar;%APP_HOME%\lib\cloudwatch-2.10.66.jar;%APP_HOME%\lib\aws-query-protocol-2.10.66.jar;%APP_HOME%\lib\protocol-core-2.10.75.jar;%APP_HOME%\lib\aws-core-2.10.75.jar;%APP_HOME%\lib\auth-2.10.75.jar;%APP_HOME%\lib\regions-2.10.75.jar;%APP_HOME%\lib\sdk-core-2.10.75.jar;%APP_HOME%\lib\apache-client-2.10.75.jar;%APP_HOME%\lib\netty-nio-client-2.10.75.jar;%APP_HOME%\lib\http-client-spi-2.10.75.jar;%APP_HOME%\lib\profiles-2.10.75.jar;%APP_HOME%\lib\utils-2.10.75.jar;%APP_HOME%\lib\annotations-2.10.75.jar;%APP_HOME%\lib\amazon-kinesis-video-streams-producer-sdk-java-1.8.0.jar;%APP_HOME%\lib\amazon-kinesis-client-1.9.3.jar;%APP_HOME%\lib\guice-multibindings-4.0.jar;%APP_HOME%\lib\guice-4.0.jar;%APP_HOME%\lib\guava-26.0-jre.jar;%APP_HOME%\lib\protobuf-java-2.6.1.jar;%APP_HOME%\lib\commons-lang3-3.8.1.jar;%APP_HOME%\lib\slf4j-log4j12-1.7.25.jar;%APP_HOME%\lib\slf4j-api-1.7.30.jar;%APP_HOME%\lib\rxjava-2.1.14.jar;%APP_HOME%\lib\aws-java-sdk-rekognition-1.11.487.jar;%APP_HOME%\lib\aws-java-sdk-kinesisvideo-1.11.487.jar;%APP_HOME%\lib\aws-lambda-java-events-1.2.0.jar;%APP_HOME%\lib\aws-java-sdk-kinesis-1.11.487.jar;%APP_HOME%\lib\aws-java-sdk-dynamodb-1.11.487.jar;%APP_HOME%\lib\aws-lambda-java-log4j-1.0.0.jar;%APP_HOME%\lib\aws-lambda-java-core-1.2.0.jar;%APP_HOME%\lib\jcodec-javase-0.2.2.jar;%APP_HOME%\lib\jcodec-0.2.2.jar;%APP_HOME%\lib\log4j-core-2.12.1.jar;%APP_HOME%\lib\log4j-api-2.12.1.jar;%APP_HOME%\lib\gson-2.8.6.jar;%APP_HOME%\lib\jna-5.3.0.jar;%APP_HOME%\lib\commons-compress-1.20.jar;%APP_HOME%\lib\aws-java-sdk-s3-1.11.487.jar;%APP_HOME%\lib\aws-java-sdk-cloudwatch-1.11.438.jar;%APP_HOME%\lib\aws-java-sdk-sns-1.12.1.jar;%APP_HOME%\lib\aws-java-sdk-cognitoidentity-1.12.1.jar;%APP_HOME%\lib\aws-java-sdk-kms-1.11.487.jar;%APP_HOME%\lib\aws-java-sdk-sqs-1.12.1.jar;%APP_HOME%\lib\aws-java-sdk-core-1.12.1.jar;%APP_HOME%\lib\jmespath-java-1.12.1.jar;%APP_HOME%\lib\jackson-annotations-2.12.3.jar;%APP_HOME%\lib\jackson-dataformat-cbor-2.12.3.jar;%APP_HOME%\lib\jackson-databind-2.12.3.jar;%APP_HOME%\lib\jackson-core-2.12.3.jar;%APP_HOME%\lib\netty-reactive-streams-http-2.0.4.jar;%APP_HOME%\lib\netty-reactive-streams-2.0.4.jar;%APP_HOME%\lib\reactive-streams-1.0.3.jar;%APP_HOME%\lib\eventstream-1.0.1.jar;%APP_HOME%\lib\httpclient-4.5.13.jar;%APP_HOME%\lib\httpcore-4.4.13.jar;%APP_HOME%\lib\netty-codec-http2-4.1.42.Final.jar;%APP_HOME%\lib\netty-codec-http-4.1.43.Final.jar;%APP_HOME%\lib\netty-handler-4.1.43.Final.jar;%APP_HOME%\lib\netty-codec-4.1.43.Final.jar;%APP_HOME%\lib\netty-transport-native-epoll-4.1.42.Final-linux-x86_64.jar;%APP_HOME%\lib\netty-transport-native-unix-common-4.1.42.Final.jar;%APP_HOME%\lib\netty-transport-4.1.43.Final.jar;%APP_HOME%\lib\netty-buffer-4.1.43.Final.jar;%APP_HOME%\lib\netty-resolver-4.1.43.Final.jar;%APP_HOME%\lib\netty-common-4.1.43.Final.jar;%APP_HOME%\lib\jsr305-3.0.2.jar;%APP_HOME%\lib\checker-qual-2.5.2.jar;%APP_HOME%\lib\error_prone_annotations-2.1.3.jar;%APP_HOME%\lib\j2objc-annotations-1.1.jar;%APP_HOME%\lib\animal-sniffer-annotations-1.14.jar;%APP_HOME%\lib\annotations-2.0.3.jar;%APP_HOME%\lib\commons-io-2.4.jar;%APP_HOME%\lib\commons-logging-1.2.jar;%APP_HOME%\lib\log4j-1.2.17.jar;%APP_HOME%\lib\commons-codec-1.15.jar;%APP_HOME%\lib\ion-java-1.0.2.jar;%APP_HOME%\lib\joda-time-2.8.1.jar;%APP_HOME%\lib\javax.inject-1.jar;%APP_HOME%\lib\aopalliance-1.0.jar


@rem Execute AWSKinesisDJL
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %AWS_KINESIS_DJL_OPTS%  -classpath "%CLASSPATH%" org.example.App %*

:end
@rem End local scope for the variables with windows NT shell
if "%ERRORLEVEL%"=="0" goto mainEnd

:fail
rem Set variable AWS_KINESIS_DJL_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
if  not "" == "%AWS_KINESIS_DJL_EXIT_CONSOLE%" exit 1
exit /b 1

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
