#!/bin/sh
set -e

APP_HOME=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
WRAPPER_DIR="$APP_HOME/gradle/wrapper"
WRAPPER_JAR="$WRAPPER_DIR/gradle-wrapper.jar"
WRAPPER_URL="https://raw.githubusercontent.com/gradle/gradle/v8.13.0/gradle/wrapper/gradle-wrapper.jar"

mkdir -p "$WRAPPER_DIR"

if [ ! -f "$WRAPPER_JAR" ]; then
  echo "Gradle wrapper jar indiriliyor..."
  if command -v curl >/dev/null 2>&1; then
    curl -fsSL "$WRAPPER_URL" -o "$WRAPPER_JAR"
  elif command -v wget >/dev/null 2>&1; then
    wget -q "$WRAPPER_URL" -O "$WRAPPER_JAR"
  else
    echo "curl veya wget bulunamadı. Gradle wrapper jar indirilemedi."
    exit 1
  fi
fi

exec java -classpath "$WRAPPER_JAR" org.gradle.wrapper.GradleWrapperMain "$@"
