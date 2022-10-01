import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

Future<String?> copyAssetFileToTempDirectory(String assetFilePath) async {
  try {
    final tempDirectory = await getTemporaryDirectory();
    final tempFilePath = join(tempDirectory.path, basename(assetFilePath));
    final assetData = await rootBundle.load(assetFilePath);
    final assetBytes = assetData.buffer
        .asUint8List(assetData.offsetInBytes, assetData.lengthInBytes);
    await File(tempFilePath).writeAsBytes(assetBytes, flush: true);
    return tempFilePath;
  } catch (_) {
    return null;
  }
}
