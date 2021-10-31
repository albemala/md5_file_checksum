import 'package:pigeon/pigeon.dart';

@HostApi()
abstract class Md5FileChecksumApi {
  String getFileChecksum(
    String filePath,
  );
}
