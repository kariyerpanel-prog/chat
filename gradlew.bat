@echo off
setlocal

set APP_HOME=%~dp0
set WRAPPER_DIR=%APP_HOME%gradle\wrapper
set WRAPPER_JAR=%WRAPPER_DIR%\gradle-wrapper.jar
set WRAPPER_URL=https://raw.githubusercontent.com/gradle/gradle/v8.13.0/gradle/wrapper/gradle-wrapper.jar

if not exist "%WRAPPER_DIR%" mkdir "%WRAPPER_DIR%"

if not exist "%WRAPPER_JAR%" (
  echo Gradle wrapper jar indiriliyor...
  powershell -NoProfile -ExecutionPolicy Bypass -Command "Invoke-WebRequest -Uri '%WRAPPER_URL%' -OutFile '%WRAPPER_JAR%'"
  if errorlevel 1 (
    echo Gradle wrapper jar indirilemedi.
    exit /b 1
  )
)

java -classpath "%WRAPPER_JAR%" org.gradle.wrapper.GradleWrapperMain %*
