import Flutter
import UIKit

public class Md5FileChecksumPlugin: NSObject, FlutterPlugin, Md5FileChecksumApi {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let api = Md5FileChecksumPlugin()
        Md5FileChecksumApiSetup.setUp(binaryMessenger: registrar.messenger(), api: api)
    }

    public func getFileChecksum(filePath: String) throws -> String {
        let fileUrl = URL(fileURLWithPath: filePath)
        do {
            return try getMd5FileChecksum(url: fileUrl) ?? ""
        } catch {
            throw PigeonError(
                code: "PLATFORM_EXCEPTION",
                message: error.localizedDescription,
                details: nil
            )
        }
    }
}
