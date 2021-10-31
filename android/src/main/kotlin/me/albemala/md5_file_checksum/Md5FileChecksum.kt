package me.albemala.md5_file_checksum

import android.util.Base64
import java.io.File
import java.io.FileInputStream
import java.security.MessageDigest

private const val BUFFER_SIZE = 16 * 1024

fun getMd5FileChecksum(filePath: String?): String {
    if (filePath.isNullOrEmpty()) throw  RuntimeException("filePath is null or empty")

    val file = File(filePath)
    if (!file.exists()) throw RuntimeException("file does not exist")

    var exception: Exception
    val inputStream = FileInputStream(file)
    try {
        val buffer = ByteArray(BUFFER_SIZE)
        var len: Int
        val md = MessageDigest.getInstance("MD5")
        while (inputStream.read(buffer).also { len = it } != -1) {
            md.update(buffer, 0, len)
        }
        val digest = md.digest()
        val checksum = String(Base64.encode(digest, Base64.DEFAULT))
        return checksum.trim { it <= ' ' }
    } catch (e: Exception) {
        exception = e
    } finally {
        try {
            inputStream.close()
        } catch (e: Exception) {
            exception = e
        }
    }
    throw exception
}
