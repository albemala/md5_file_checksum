import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:md5_file_checksum/md5_file_checksum.dart';
import 'package:md5_file_checksum_example/gen/assets.gen.dart';
import 'package:md5_file_checksum_example/utils/file.dart';

void main() {
  // IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("getFileChecksum no file", (tester) async {
    const filePath = "/path/to/non/existing/file";

    final stopwatch = Stopwatch()..start();
    expect(
      () async => await Md5FileChecksum.getFileChecksum(filePath: filePath),
      throwsA(isA<FileSystemException>()),
    );
    stopwatch.stop();
    print('getFileChecksum() executed in ${stopwatch.elapsed.inMilliseconds}');
  });
  testWidgets("getFileChecksum file1", (tester) async {
    final tempFilePath = await copyAssetFileToTempDirectory(Assets.file1) ?? "";

    final stopwatch = Stopwatch()..start();
    expect(
      await Md5FileChecksum.getFileChecksum(filePath: tempFilePath),
      "JgcGL0Ta4JR+F9RiUxyAsA==",
    );
    stopwatch.stop();
    print('getFileChecksum() executed in ${stopwatch.elapsed.inMilliseconds}');
  });
  testWidgets("getFileChecksum file2", (tester) async {
    final tempFilePath = await copyAssetFileToTempDirectory(Assets.file2) ?? "";

    final stopwatch = Stopwatch()..start();
    expect(
      await Md5FileChecksum.getFileChecksum(filePath: tempFilePath),
      "BlZHAyvHt8km86IF93/m+w==",
    );
    stopwatch.stop();
    print('getFileChecksum() executed in ${stopwatch.elapsed.inMilliseconds}');
  });
  testWidgets("getFileChecksum file3", (tester) async {
    final tempFilePath = await copyAssetFileToTempDirectory(Assets.file3) ?? "";

    final stopwatch = Stopwatch()..start();
    expect(
      await Md5FileChecksum.getFileChecksum(filePath: tempFilePath),
      "nDa2ez85GlufMMUm7oSOhg==",
    );
    stopwatch.stop();
    print('getFileChecksum() executed in ${stopwatch.elapsed.inMilliseconds}');
  });
}
