#import "FlutterActivityIndicator.h"
#import "UIColor+RGB.h"
//#import <adsfasfasdasdf/adsfasfasdasdf-Swift.h>



@implementation FlutterActivityIndicatorFactory{
    NSObject<FlutterBinaryMessenger>*_messenger;
}

- (instancetype)initWithMessenger:(NSObject<FlutterBinaryMessenger> *)messager{
    self = [super init];
    if (self) {
        _messenger = messager;
    }
    return self;
}

-(NSObject<FlutterMessageCodec> *)createArgsCodec{
    return [FlutterStandardMessageCodec sharedInstance];
}

-(NSObject<FlutterPlatformView> *)createWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewId arguments:(id)args{
    
   FlutterActivityIndicatorController*activity = [[FlutterActivityIndicatorController alloc] initWithWithFrame:frame viewIdentifier:viewId arguments:args binaryMessenger:_messenger];
    
    return activity;
    
}

@end

@implementation FlutterActivityIndicatorController{
    int64_t _viewId;
    FlutterMethodChannel* _channel;
    UIActivityIndicatorView * _indicator;
    UIView * _isui;
    UIButton * _pickButton;
    SwiftViewControllerA *controller;


}

- (instancetype)initWithWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewId arguments:(id)args binaryMessenger:(NSObject<FlutterBinaryMessenger> *)messenger{
    if ([super init]) {
        
        _isui = [[UIView alloc] init];
        _isui.frame = CGRectMake(0, 0, 200, 200);
        _isui.backgroundColor = [UIColor redColor];
        _pickButton.backgroundColor = [UIColor redColor];
        _pickButton.frame = CGRectMake(100, 100, 100, 40);

//        TestViewController *ec = [TestViewController new];
        //ec = [[Testa alloc]init];
        //[self.view ]


        
        _viewId = viewId;
        NSString* channelName = [NSString stringWithFormat:@"plugins/activity_indicator_%lld", viewId];
        _channel = [FlutterMethodChannel methodChannelWithName:channelName binaryMessenger:messenger];
        __weak __typeof__(self) weakSelf = self;
        [_channel setMethodCallHandler:^(FlutterMethodCall *  call, FlutterResult  result) {
            [weakSelf onMethodCall:call result:result];
        }];
        
    }
    
    return self;
}

-(UIView *)view{
    return _isui;
}

-(void)onMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result{
    if ([[call method] isEqualToString:@"start"]) {
//        [_indicator startAnimating];
//        UITableViewController * ec = [[ExampleViewController alloc]init];
//        [ec showPicker];


        [self.view setHidden:false];
        self.view.backgroundColor = [UIColor blueColor];
        printf("start");
    }else
    if ([[call method] isEqualToString:@"stop"]){
        
        [self.view setHidden:true];
        self.view.backgroundColor = [UIColor blueColor];
        printf("start");
//        [_indicator stopAnimating];
    }
    else {
        result(FlutterMethodNotImplemented);
    }
}



@end


