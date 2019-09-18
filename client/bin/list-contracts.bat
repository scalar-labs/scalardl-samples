@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  list-contracts startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Add default JVM options here. You can also use JAVA_OPTS and LIST_CONTRACTS_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if "%ERRORLEVEL%" == "0" goto init

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto init

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:init
@rem Get command-line arguments, handling Windows variants

if not "%OS%" == "Windows_NT" goto win9xME_args

:win9xME_args
@rem Slurp the command line arguments.
set CMD_LINE_ARGS=
set _SKIP=2

:win9xME_args_slurp
if "x%~1" == "x" goto execute

set CMD_LINE_ARGS=%*

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\client.jar;%APP_HOME%\lib\ordering.jar;%APP_HOME%\lib\proof.jar;%APP_HOME%\lib\ledger.jar;%APP_HOME%\lib\rpc.jar;%APP_HOME%\lib\scalardb-1.1.0.jar;%APP_HOME%\lib\slf4j-log4j12-1.7.25.jar;%APP_HOME%\lib\guice-4.2.0.jar;%APP_HOME%\lib\javax.json-api-1.1.4.jar;%APP_HOME%\lib\javax.json-1.1.4.jar;%APP_HOME%\lib\bcpkix-jdk15on-1.59.jar;%APP_HOME%\lib\toml4j-0.7.2.jar;%APP_HOME%\lib\kafka-clients-2.1.0.jar;%APP_HOME%\lib\cassandra-driver-core-3.6.0.jar;%APP_HOME%\lib\metrics-core-3.2.2.jar;%APP_HOME%\lib\slf4j-api-1.7.25.jar;%APP_HOME%\lib\log4j-1.2.17.jar;%APP_HOME%\lib\javax.inject-1.jar;%APP_HOME%\lib\aopalliance-1.0.jar;%APP_HOME%\lib\grpc-alts-1.13.2.jar;%APP_HOME%\lib\grpc-services-1.13.2.jar;%APP_HOME%\lib\grpc-grpclb-1.13.2.jar;%APP_HOME%\lib\grpc-protobuf-1.13.2.jar;%APP_HOME%\lib\protobuf-java-util-3.6.0.jar;%APP_HOME%\lib\grpc-netty-1.13.2.jar;%APP_HOME%\lib\grpc-stub-1.13.2.jar;%APP_HOME%\lib\grpc-protobuf-lite-1.13.2.jar;%APP_HOME%\lib\grpc-core-1.13.2.jar;%APP_HOME%\lib\guava-24.1-jre.jar;%APP_HOME%\lib\proto-google-common-protos-1.0.0.jar;%APP_HOME%\lib\netty-tcnative-boringssl-static-2.0.7.Final.jar;%APP_HOME%\lib\bcprov-jdk15on-1.59.jar;%APP_HOME%\lib\gson-2.8.1.jar;%APP_HOME%\lib\jsr305-3.0.0.jar;%APP_HOME%\lib\checker-compat-qual-2.0.0.jar;%APP_HOME%\lib\error_prone_annotations-2.1.3.jar;%APP_HOME%\lib\j2objc-annotations-1.1.jar;%APP_HOME%\lib\animal-sniffer-annotations-1.14.jar;%APP_HOME%\lib\protobuf-java-3.6.0.jar;%APP_HOME%\lib\commons-lang3-3.5.jar;%APP_HOME%\lib\netty-codec-http2-4.1.25.Final.jar;%APP_HOME%\lib\netty-handler-proxy-4.1.25.Final.jar;%APP_HOME%\lib\re2j-1.2.jar;%APP_HOME%\lib\zstd-jni-1.3.5-4.jar;%APP_HOME%\lib\lz4-java-1.5.0.jar;%APP_HOME%\lib\snappy-java-1.1.7.2.jar;%APP_HOME%\lib\grpc-context-1.13.2.jar;%APP_HOME%\lib\opencensus-contrib-grpc-metrics-0.12.3.jar;%APP_HOME%\lib\opencensus-api-0.12.3.jar;%APP_HOME%\lib\netty-codec-http-4.1.25.Final.jar;%APP_HOME%\lib\netty-handler-4.1.25.Final.jar;%APP_HOME%\lib\netty-codec-socks-4.1.25.Final.jar;%APP_HOME%\lib\netty-codec-4.1.25.Final.jar;%APP_HOME%\lib\netty-transport-4.1.25.Final.jar;%APP_HOME%\lib\netty-buffer-4.1.25.Final.jar;%APP_HOME%\lib\netty-resolver-4.1.25.Final.jar;%APP_HOME%\lib\jnr-posix-3.0.44.jar;%APP_HOME%\lib\jnr-ffi-2.1.7.jar;%APP_HOME%\lib\netty-common-4.1.25.Final.jar;%APP_HOME%\lib\jffi-1.2.16.jar;%APP_HOME%\lib\jffi-1.2.16-native.jar;%APP_HOME%\lib\asm-commons-5.0.3.jar;%APP_HOME%\lib\asm-analysis-5.0.3.jar;%APP_HOME%\lib\asm-util-5.0.3.jar;%APP_HOME%\lib\asm-tree-5.0.3.jar;%APP_HOME%\lib\asm-5.0.3.jar;%APP_HOME%\lib\jnr-x86asm-1.0.2.jar;%APP_HOME%\lib\jnr-constants-0.9.9.jar

@rem Execute list-contracts
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %LIST_CONTRACTS_OPTS%  -classpath "%CLASSPATH%" com.scalar.client.tool.ContractsListing %CMD_LINE_ARGS%

:end
@rem End local scope for the variables with windows NT shell
if "%ERRORLEVEL%"=="0" goto mainEnd

:fail
rem Set variable LIST_CONTRACTS_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
if  not "" == "%LIST_CONTRACTS_EXIT_CONSOLE%" exit 1
exit /b 1

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
