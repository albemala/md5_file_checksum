#!/usr/bin/env bash

# Used to generate platform interfaces
# How to use: bash scripts/generate-pigeon-files.bash

dart run pigeon \
  --input pigeon/interface.dart \
  --dart_out lib/src/interface.dart \
  --swift_out ios/md5_file_checksum/Sources/md5_file_checksum/Pigeon.swift \
  --java_out ./android/src/main/java/dev/flutter/pigeon/Pigeon.java \
  --java_package "dev.flutter.pigeon"
dart format lib/