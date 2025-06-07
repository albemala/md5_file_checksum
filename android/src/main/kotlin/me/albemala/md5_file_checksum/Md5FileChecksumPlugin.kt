package me.albemala.md5_file_checksum

import androidx.annotation.NonNull
import dev.flutter.pigeon.Pigeon
import io.flutter.embedding.engine.plugins.FlutterPlugin
import me.albemala.md5_file_checksum.getMd5FileChecksum

class Md5FileChecksumPlugin: FlutterPlugin, Pigeon.Md5FileChecksumApi {
  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    Pigeon.Md5FileChecksumApi.setUp(flutterPluginBinding.binaryMessenger, this)
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    Pigeon.Md5FileChecksumApi.setUp(binding.binaryMessenger, null)
  }

  override fun getFileChecksum(filePath: String): String {
    return getMd5FileChecksum(filePath)
  }
}
