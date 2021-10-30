import 'dart:async';

import 'package:flutter/services.dart';

class Md5FileChecksum {
  static const MethodChannel _channel = MethodChannel("md5_file_checksum");

  /// Calculates the MD5 checksum of a file
  /// - [filePath]: Absolute file path
  static Future<String?> getFileChecksum({
    required String filePath,
  }) async {
    final args = {
      "filePath": filePath,
    };
    return await _channel.invokeMethod<String>("getFileChecksum", args);
  }
}
