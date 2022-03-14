import Flutter
import UIKit

public class SwiftMd5FileChecksumPlugin: NSObject, FlutterPlugin, Md5FileChecksumApi {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let messenger = registrar.messenger()
        let api = SwiftMd5FileChecksumPlugin()
        Md5FileChecksumApiSetup(messenger, api);
    }

    public func getFileChecksumFilePath(
        _ filePath: String,
        completion: @escaping (String?, FlutterError?) -> Void
    ) {
        let fileUrl = URL(fileURLWithPath: filePath)
        do {
            let checksum = try getMd5FileChecksum(url: fileUrl)
            completion(checksum, nil)
        } catch (let exception) {
            let error = FlutterError(
                code: "PLATFORM_EXCEPTION",
                message: exception.localizedDescription,
                details: nil
            )
            completion("", error)
        }
    }
}
