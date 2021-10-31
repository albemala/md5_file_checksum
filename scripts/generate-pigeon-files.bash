#!/usr/bin/env bash

# Used to generate platform interfaces
# Run from inside scripts/ folder

cd .. || exit

flutter pub run pigeon \
  --input pigeon/interface.dart \
  --dart_out lib/src/interface.dart \
  --objc_header_out ios/Classes/pigeon.h \
  --objc_source_out ios/Classes/pigeon.m \
  --java_out ./android/src/main/java/dev/flutter/pigeon/Pigeon.java \
  --java_package "dev.flutter.pigeon"
