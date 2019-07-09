//
//  ViewController.m
//  iosxxOc
//
//  Created by 李奕权 on 2019/7/9.
//  Copyright © 2019 李奕权. All rights reserved.
//

#import "ViewController.h"
#import "testClass.h"
#import "RPoing.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (weak, nonatomic) IBOutlet UIView *viewa;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)testClick:(id)sender {
    NSString * nameB = self.name.text;
    NSLog(@"%@",nameB);
    if([[self.name.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length] == 0){
        self.messageLabel.text = @"为空哦";
        self.viewa.backgroundColor = [UIColor redColor];
    }else{
        NSString * message = [NSString stringWithFormat:@"你好！ %@",nameB];
        self.messageLabel.text = message;
        self.viewa.backgroundColor = [UIColor blueColor];
    }
//    if(nameB == nil || nameB.length < 0 || nameB == NULL){
//        self.messageLabel.text = @"为空哦";
//    }else{
//        NSString * message = [NSString stringWithFormat:@"你好！ %@",nameB];
//        self.messageLabel.text = message;
//    }
    
}


@end
