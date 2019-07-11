#import "FluttetioscPlugin.h"
#import <fluttetiosc/fluttetiosc-Swift.h>

@implementation FluttetioscPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFluttetioscPlugin registerWithRegistrar:registrar];
}
@end
