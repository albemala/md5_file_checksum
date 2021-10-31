import 'dart:async';
import 'dart:io';

import 'src/interface.dart';

class Md5FileChecksum {
  static late final _api = Md5FileChecksumApi();

  /// Calculates the MD5 checksum of a file
  ///
  /// - [filePath]: Absolute file path
  ///
  /// Throws a [FileSystemException] if the file does not exist.
  /// Throws a [PlatformException] if some other error occurs.
  static Future<String> getFileChecksum({
    required String filePath,
  }) async {
    final fileExists = File(filePath).existsSync();
    if (!fileExists) throw FileSystemException("File does not exist", filePath);

    return await _api.getFileChecksum(filePath);
  }
}
