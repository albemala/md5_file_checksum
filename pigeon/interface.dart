import 'package:pigeon/pigeon.dart';

@HostApi()
abstract class Md5FileChecksumApi {
  @TaskQueue(type: TaskQueueType.serialBackgroundThread)
  String getFileChecksum(
    String filePath,
  );
}
