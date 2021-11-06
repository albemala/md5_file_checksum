import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:md5_file_checksum/md5_file_checksum.dart';
import 'package:md5_file_checksum_example/gen/assets.gen.dart';
import 'package:md5_file_checksum_example/utils/file.dart';

void main() {
  testWidgets("performance test", (tester) async {
    final tempFile1Path = await copyAssetFileToTempDirectory(Assets.file1) ?? "";
    _runAndMeasure(() async {
      await Md5FileChecksum.getFileChecksum(filePath: tempFile1Path);
    });
    _runAndMeasure(() async {
      await _getFileChecksumUsingDart(filePath: tempFile1Path);
    });

    final tempFile2Path = await copyAssetFileToTempDirectory(Assets.file2) ?? "";
    _runAndMeasure(() async {
      await Md5FileChecksum.getFileChecksum(filePath: tempFile2Path);
    });
    _runAndMeasure(() async {
      await _getFileChecksumUsingDart(filePath: tempFile2Path);
    });

    final tempFile3Path = await copyAssetFileToTempDirectory(Assets.file3) ?? "";
    _runAndMeasure(() async {
      await Md5FileChecksum.getFileChecksum(filePath: tempFile3Path);
    });
    _runAndMeasure(() async {
      await _getFileChecksumUsingDart(filePath: tempFile3Path);
    });
  });
}

Future<void> _runAndMeasure(Future<void> Function() function) async {
  final stopwatch = Stopwatch()..start();
  await function();
  stopwatch.stop();
  print('${function.runtimeType} executed in ${stopwatch.elapsed.inMilliseconds}');
}

Future<String?> _getFileChecksumUsingDart({
  required String filePath,
}) async {
  final file = File(filePath);
  if (!file.existsSync()) return null;

  try {
    final stream = file.openRead();
    final hash = await md5.bind(stream).first;
    return base64.encode(hash.bytes);
  } catch (exception) {
    return null;
  }
}
