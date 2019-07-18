#import "ImageTailorPlugin.h"
#import <image_tailor/image_tailor-Swift.h>

@implementation ImageTailorPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftImageTailorPlugin registerWithRegistrar:registrar];
}
@end
