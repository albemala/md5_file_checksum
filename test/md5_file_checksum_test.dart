import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:md5_file_checksum/md5_file_checksum.dart';

const _mockChecksum = "M78Wt4LB0sUBb+LcR8HfRg==";

void main() {
  const channel = MethodChannel("md5_file_checksum");

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return _mockChecksum;
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test("getFileChecksum invokes platform method", () async {
    expect(
      await Md5FileChecksum.getFileChecksum(
        filePath: "/path/to/file",
      ),
      _mockChecksum,
    );
  });
}
