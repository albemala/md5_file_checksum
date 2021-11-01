[![Pub](https://img.shields.io/pub/v/md5_file_checksum)](https://pub.dev/packages/md5_file_checksum)

# md5_file_checksum

A Flutter plugin for getting the MD5 hash of a file. Revamped version of [md5_plugin](https://pub.dev/packages/md5_plugin).

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
