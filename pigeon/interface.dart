import 'package:pigeon/pigeon.dart';

@HostApi()
abstract class Md5FileChecksumApi {
  @async
  String getFileChecksum(
    String filePath,
  );
}
