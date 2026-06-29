import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:md5_file_checksum/md5_file_checksum.dart';
import 'package:md5_file_checksum_example/gen/assets.gen.dart';
import 'package:md5_file_checksum_example/utils/file.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

void main() {
  // IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("getFileChecksum no file", (tester) async {
    const filePath = "/path/to/non/existing/file";
    expect(
      () async => await Md5FileChecksum.getFileChecksum(filePath: filePath),
      throwsA(isA<FileSystemException>()),
    );
  });
  testWidgets("getFileChecksum file1", (tester) async {
    final tempFilePath = await copyAssetFileToTempDirectory(Assets.file1) ?? "";
    expect(
      await Md5FileChecksum.getFileChecksum(filePath: tempFilePath),
      "JgcGL0Ta4JR+F9RiUxyAsA==",
    );
  });
  testWidgets("getFileChecksum file2", (tester) async {
    final tempFilePath = await copyAssetFileToTempDirectory(Assets.file2) ?? "";
    expect(
      await Md5FileChecksum.getFileChecksum(filePath: tempFilePath),
      "BlZHAyvHt8km86IF93/m+w==",
    );
  });
  testWidgets("getFileChecksum file3", (tester) async {
    final tempFilePath = await copyAssetFileToTempDirectory(Assets.file3) ?? "";
    expect(
      await Md5FileChecksum.getFileChecksum(filePath: tempFilePath),
      "e+gwxkGhP8TFyxsl4ZtSFw==",
    );
  });
  testWidgets("getFileChecksum empty path", (tester) async {
    expect(
      () async => await Md5FileChecksum.getFileChecksum(filePath: ""),
      throwsA(isA<FileSystemException>()),
    );
  });
  testWidgets("getFileChecksum directory path", (tester) async {
    final dir = await getTemporaryDirectory();
    expect(
      () async => await Md5FileChecksum.getFileChecksum(filePath: dir.path),
      throwsA(isA<FileSystemException>()),
    );
  });
  testWidgets("getFileChecksum empty file", (tester) async {
    final tempFilePath = await _writeTempFile("empty.bin", const <int>[]);
    expect(
      await Md5FileChecksum.getFileChecksum(filePath: tempFilePath),
      "1B2M2Y8AsgTpgAmY7PhCfg==",
    );
  });
  testWidgets("getFileChecksum large file (multi-buffer read)", (tester) async {
    // 32 KiB of zero bytes — exceeds the native 16 KiB read buffer, so the
    // chunked-read loop is exercised end-to-end.
    final tempFilePath =
        await _writeTempFile("zeros_32k.bin", List<int>.filled(32 * 1024, 0));
    expect(
      await Md5FileChecksum.getFileChecksum(filePath: tempFilePath),
      "u33wThsKJXBldSen4QiuIw==",
    );
  });
  testWidgets("getFileChecksum is deterministic", (tester) async {
    final tempFilePath = await copyAssetFileToTempDirectory(Assets.file1) ?? "";
    final first = await Md5FileChecksum.getFileChecksum(filePath: tempFilePath);
    final second =
        await Md5FileChecksum.getFileChecksum(filePath: tempFilePath);
    expect(first, equals(second));
  });
}

Future<String> _writeTempFile(String name, List<int> bytes) async {
  final dir = await getTemporaryDirectory();
  final path = p.join(dir.path, name);
  await File(path).writeAsBytes(bytes, flush: true);
  return path;
}
