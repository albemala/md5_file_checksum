import CommonCrypto
import CryptoKit

// Reference: https://stackoverflow.com/questions/42935148/swift-calculate-md5-checksum-for-large-files

func getMd5FileChecksum(url: URL) throws -> String? {
    let file = try FileHandle(forReadingFrom: url)
    defer {
        file.closeFile()
    }
    if #available(iOS 13, *) {
        return getMd5FileChecksumNew(file: file)?.base64EncodedString()
    } else {
        return getMd5FileChecksumOld(file: file)?.base64EncodedString()
    }
}

fileprivate let bufferSize = 16 * 1024

@available(iOS 13.0, *)
fileprivate func getMd5FileChecksumNew(file: FileHandle) -> Data? {
    // Create and initialize MD5 context:
    var md5 = CryptoKit.Insecure.MD5()
    // Read up to `bufferSize` bytes, until EOF is reached, and update MD5 context:
    while autoreleasepool(invoking: {
        let data = file.readData(ofLength: bufferSize)
        if data.count > 0 {
            md5.update(data: data)
            return true // Continue
        } else {
            return false // End of file
        }
    }) {}
    // Compute the MD5 digest:
    return Data(md5.finalize())
}

fileprivate func getMd5FileChecksumOld(file: FileHandle) -> Data? {
    // Create and initialize MD5 context:
    var context = CC_MD5_CTX()
    CC_MD5_Init(&context)
    // Read up to `bufferSize` bytes, until EOF is reached, and update MD5 context:
    while autoreleasepool(invoking: {
        let data = file.readData(ofLength: bufferSize)
        if data.count > 0 {
            data.withUnsafeBytes {
                _ = CC_MD5_Update(&context, $0.baseAddress, numericCast(data.count))
            }
            return true // Continue
        } else {
            return false // End of file
        }
    }) {}
    // Compute the MD5 digest:
    var digest: [UInt8] = Array(repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
    _ = CC_MD5_Final(&digest, &context)
    return Data(digest)
}
