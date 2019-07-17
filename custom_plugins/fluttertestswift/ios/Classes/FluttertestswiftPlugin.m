#import "FluttertestswiftPlugin.h"
#import <fluttertestswift/fluttertestswift-Swift.h>

@implementation FluttertestswiftPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFluttertestswiftPlugin registerWithRegistrar:registrar];
}
@end
