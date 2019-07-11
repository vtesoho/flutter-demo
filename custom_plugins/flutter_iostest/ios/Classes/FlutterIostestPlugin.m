#import "FlutterIostestPlugin.h"
#import <flutter_iostest/flutter_iostest-Swift.h>

@implementation FlutterIostestPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterIostestPlugin registerWithRegistrar:registrar];
}
@end
