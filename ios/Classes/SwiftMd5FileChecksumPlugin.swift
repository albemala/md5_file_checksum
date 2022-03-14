import Flutter
import UIKit

public class SwiftMd5FileChecksumPlugin: NSObject, FlutterPlugin, Md5FileChecksumApi {

    public static func register(with registrar: FlutterPluginRegistrar) {
        let plugin = SwiftMd5FileChecksumPlugin()
        registrar.publish(plugin)
        Md5FileChecksumApiSetup(registrar.messenger(), plugin);
    }

    public func detachFromEngine(for registrar: FlutterPluginRegistrar) {
        Md5FileChecksumApiSetup(registrar.messenger(), nil);
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
