import 'dart:async';

import 'package:flutter/material.dart';
import 'package:md5_file_checksum/md5_file_checksum.dart';
import 'package:md5_file_checksum_example/gen/assets.gen.dart';
import 'package:md5_file_checksum_example/utils/file.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _fileChecksum = "---";

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    try {
      final tempFilePath = await copyAssetFileToTempDirectory(Assets.file1) ?? "";
      final fileChecksum = await Md5FileChecksum.getFileChecksum(filePath: tempFilePath);

      if (!mounted) return;
      setState(() {
        _fileChecksum = fileChecksum;
      });
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('File checksum: $_fileChecksum'),
        ),
      ),
    );
  }
}
