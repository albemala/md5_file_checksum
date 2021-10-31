package me.albemala.md5_file_checksum

import androidx.annotation.NonNull
import dev.flutter.pigeon.Pigeon
import io.flutter.embedding.engine.plugins.FlutterPlugin

class Md5FileChecksumPlugin: FlutterPlugin, Pigeon.Md5FileChecksumApi {
  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    Pigeon.Md5FileChecksumApi.setup(flutterPluginBinding.binaryMessenger, this)
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    Pigeon.Md5FileChecksumApi.setup(binding.binaryMessenger, null)
  }

  override fun getFileChecksum(filePath: String?): String {
    return getMd5FileChecksum(filePath)
  }
}

