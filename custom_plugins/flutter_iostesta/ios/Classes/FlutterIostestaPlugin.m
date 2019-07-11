#import "FlutterIostestaPlugin.h"
#import <flutter_iostesta/flutter_iostesta-Swift.h>

@implementation FlutterIostestaPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterIostestaPlugin registerWithRegistrar:registrar];
}
@end
