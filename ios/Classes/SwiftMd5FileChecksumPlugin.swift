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
        error: AutoreleasingUnsafeMutablePointer<FlutterError?>
    ) -> String? {
        let fileUrl = URL(fileURLWithPath: filePath)
        do {
            return try getMd5FileChecksum(url: fileUrl)
        } catch (let exception) {
            error.pointee = FlutterError(
                code: "PLATFORM_EXCEPTION",
                message: exception.localizedDescription,
                details: nil
            )
            return ""
        }
    }
}
