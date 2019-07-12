#import "FlutterPluginaabbPlugin.h"
#import <flutter_pluginaabb/flutter_pluginaabb-Swift.h>

@implementation FlutterPluginaabbPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterPluginaabbPlugin registerWithRegistrar:registrar];
}
@end
