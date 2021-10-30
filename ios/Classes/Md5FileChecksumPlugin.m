#import "Md5FileChecksumPlugin.h"
#if __has_include(<md5_file_checksum/md5_file_checksum-Swift.h>)
#import <md5_file_checksum/md5_file_checksum-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "md5_file_checksum-Swift.h"
#endif

@implementation Md5FileChecksumPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftMd5FileChecksumPlugin registerWithRegistrar:registrar];
}
@end
