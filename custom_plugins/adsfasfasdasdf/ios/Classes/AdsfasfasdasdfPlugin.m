#import "AdsfasfasdasdfPlugin.h"
#import "FlutterActivityIndicator.h"

@implementation AdsfasfasdasdfPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    [registrar registerViewFactory:[[FlutterActivityIndicatorFactory alloc] initWithMessenger:registrar.messenger] withId:@"plugins/activity_indicator"];
    
}
@end
