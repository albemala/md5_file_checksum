### Notice

This project is archived and I won't update it any more.

I have run some performance tests to compare this implementation with a pure Dart one using Flutter 3 and Dart 2.17. The results of the 2 methods are comparable and in the same order of magnitude. Therefore, in my opinion, a native implementation is not needed any more to calculate a file checksum.

A Dart implementation could be like:

```dart
Future<String?> getFileChecksum(String filePath) async {
  final file = File(filePath);
  if (!file.existsSync()) return null;
  try {
    final stream = file.openRead();
    final hash = await md5.bind(stream).first;
    // NOTE: You might not need to convert it to base64
    return base64.encode(hash.bytes);
  } catch (exception) {
    return null;
  }
}
```

# md5_file_checksum

[![Pub](https://img.shields.io/pub/v/md5_file_checksum)](https://pub.dev/packages/md5_file_checksum)

Flutter plugin to calculate a file checksum as MD5 hash, using a platform native implementation. 

Revamped version of [md5_plugin](https://pub.dev/packages/md5_plugin).

## Usage

```dart
try {
  final fileChecksum = await Md5FileChecksum.getFileChecksum(filePath: filePath);
} catch (exception) {
  print('Unable to generate file checksum: $exception');
}
```

## Result

![Simulator Screen Shot - iPhone 13 - 2021-10-31 at 15 22 06](https://user-images.githubusercontent.com/2332860/139654021-7187e07e-6c1d-45a4-8c64-5197e5183aa5.png)
